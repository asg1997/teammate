import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/custom_navigation_tab_bar_widget.dart';
import 'package:teammate/core/widgets/games_list_view/games_list_view.dart';
import 'package:teammate/feachers/main/presentation/main_screen/cubit/main_screen_cubit.dart';

import '../../../../core/bloc_utils/base_status.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../resources/resources.dart';
import '../../../game/domain/entites/game.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CustomNavigationTabBarWidget(
        onCreateGameTapped: () {},
        onMenuTapped: () {},
        onSearchTapped: () {},
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
                      style: AppFonts.titleMedium,
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
    );
  }
}

class _GamesListView extends StatelessWidget {
  const _GamesListView(this.games);
  final List<Game> games;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return Padding(
          padding: AppDecorationProp.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Мои игры',
                style: AppFonts.titleMedium,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 330,
                child: GamesListView(
                  shrinkWrap: true,
                  games: games,
                  onGameSelected: (Game game) {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
