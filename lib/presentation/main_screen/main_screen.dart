import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/custom_navigation_tab_bar_widget.dart';
import 'package:teammate/core/widgets/games_list_view/games_list_view.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/entities/sport.dart';
import 'package:teammate/presentation/create_game/cubit/create_game_cubit.dart';
import 'package:teammate/presentation/main_screen/model.dart';

import 'package:teammate/resources/resources.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  OverlayEntry? _overlayEntry;

  void _showSportOverlay(
    BuildContext context,
    void Function(Sport value) onSportSelected,
  ) {
    if (_overlayEntry != null) {
      _removeOverlay();
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final overlay = Overlay.of(context);

      _overlayEntry = OverlayEntry(
        builder: (_) => Positioned(
          right: 20,
          bottom: 130,
          width: 200,
          child: SportFloatingWidget(onSportSelected: onSportSelected),
        ),
      );
      overlay.insert(_overlayEntry!);
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();
    return GestureDetector(
      onTap: _removeOverlay,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: CustomNavigationTabBarWidget(
          onCreateGameTapped: () {
            _showSportOverlay(context, (sport) {
              context.read<CreateGameCubit>().onSportChanged(sport);
              model.onAddGameButtonTapped(context);
              _removeOverlay();
            });
          },
          onMenuTapped: () => model.onSettingsTapped(context),
          onSearchTapped: () => model.onSearchTapped(context),
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                AppImages.footballer,
                fit: BoxFit.fitWidth,
              ),
            ),
            Consumer<MainScreenModel>(
              builder: (__, model, _) {
                if (model.isLoading) return const LoadingWidget();
                if (model.games.isEmpty) {
                  return Center(
                    child: Text(
                      'У вас пока нет игр',
                      style: AppFonts.titleLarge,
                    ),
                  );
                }

                return _GamesListView(model.games);
              },
            )
          ],
        ),
      ),
    );
  }
}

class _GamesListView extends StatelessWidget {
  const _GamesListView(this.games);
  final List<Game> games;
  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenModel>();
    return Padding(
      padding: AppDecorations.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Мои игры',
            style: AppFonts.titleLarge,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 330,
            child: GamesListView(
              shrinkWrap: true,
              games: games,
              onGameSelected: (game) => model.onGameTapped(context, game),
            ),
          ),
        ],
      ),
    );
  }
}

class SportFloatingWidget extends StatelessWidget {
  const SportFloatingWidget({
    required this.onSportSelected,
    super.key,
  });
  final void Function(Sport value) onSportSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppDecorations.defaultBorderRadius,
        color: AppColors.secondaryBg,
      ),
      padding: const EdgeInsets.all(20),
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: List.generate(
          Sport.values.length,
          (index) => SizedBox(
            height: 50,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onSportSelected(Sport.values[index]),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Sport.values[index].localized,
                    style: AppFonts.bodyLarge.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
