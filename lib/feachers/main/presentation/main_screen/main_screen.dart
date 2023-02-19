import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/custom_navigation_tab_bar_widget.dart';
import 'package:teammate/core/widgets/games_list_view/games_list_view.dart';
import 'package:teammate/feachers/game/domain/entites/sport_.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/cubit/create_game_cubit.dart';
import 'package:teammate/feachers/main/presentation/main_screen/cubit/main_screen_cubit.dart';

import '../../../../core/bloc_utils/base_status.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../resources/resources.dart';
import '../../../game/domain/entites/game.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  OverlayEntry? _overlayEntry;

  void _showSportOverlay(
      BuildContext context, Function(Sport value) onSportSelected) {
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

  _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenCubit>();
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
        body: Stack(children: [
          SizedBox.expand(
            child: Image.asset(
              AppImages.footballer,
              fit: BoxFit.fitWidth,
            ),
          ),
          BlocBuilder<MainScreenCubit, MainScreenState>(
            builder: (context, state) {
              switch (state.status) {
                case BaseStatus.loading:
                  return const LoadingWidget();
                case BaseStatus.loaded:
                  if (state.games.isEmpty) {
                    return Center(
                      child: Text(
                        'У вас пока нет игр',
                        style: AppFonts.titleLarge,
                      ),
                    );
                  } else {
                    return Align(
                        alignment: Alignment.bottomCenter,
                        child: _GamesListView(state.games));
                  }
                case BaseStatus.error:
                  return const Center(
                    child: Text('Ошибка соединения с сервером'),
                  );
              }
            },
          )
        ]),
      ),
    );
  }
}

class _GamesListView extends StatelessWidget {
  const _GamesListView(this.games);
  final List<Game> games;
  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenCubit>();
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return Padding(
          padding: AppDecProp.defaultPadding,
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
      },
    );
  }
}

class SportFloatingWidget extends StatelessWidget {
  const SportFloatingWidget({super.key, required this.onSportSelected});
  final Function(Sport value) onSportSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppDecProp.defaultBorderRadius,
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
                            Sport.values[index].name(),
                            style: AppFonts.bodyLarge
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )),
                )),
      ),
    );
  }
}
