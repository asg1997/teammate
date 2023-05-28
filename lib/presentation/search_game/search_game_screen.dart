// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/games_list_view/games_list_view.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/presentation/search_game/cubit/search_game_screen_cubit.dart';

class SearchGameScreen extends StatelessWidget {
  const SearchGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: AppDecorations.defaultPadding,
            child: Column(
              children: const [
                // ПОИСК ИГР
                MainAppBarWidget(title: 'Поиск игр'),
                SizedBox(height: 30),

                // ПОИСК
                SearchTextField(),
                SizedBox(height: 20),

                // ЛИСТВЬЮ С ИГРАМИ
                Expanded(
                  child: _ListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchGameScreenCubit, SearchGameScreenState>(
      builder: (context, state) {
        switch (state.status) {
          case SearchGameScreenStatus.loading:
            return const LoadingWidget();

          case SearchGameScreenStatus.search:
            if (state.filteredGames.isEmpty) {
              return const Center(
                child: Text(
                  'По заданному фильтру игры не найдены. Попробуйте изменить поиск',
                  textAlign: TextAlign.center,
                ),
              );
            }
            return GamesListView(
              onBottom: context.read<SearchGameScreenCubit>().loadMore,
              games: state.filteredGames,
            );
          case SearchGameScreenStatus.loaded:
          case SearchGameScreenStatus.loadingMore:
            if (state.games.isEmpty) {
              return const Center(child: Text('Игр не найдено'));
            } else {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  GamesListView(
                    onBottom: context.read<SearchGameScreenCubit>().loadMore,
                    games: state.games,
                  ),
                  if (state.status == SearchGameScreenStatus.loadingMore) ...[
                    const Positioned(
                      bottom: 0,
                      child: LoadingWidget(),
                    )
                  ]
                ],
              );
            }
          case SearchGameScreenStatus.error:
            return const Center(
              child: Text('Не удалось загрузить игры'),
            );
        }
      },
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SearchGameScreenCubit>();
    return TextFieldWidget(
      onChanged: model.onSearchChanged,
      hint: 'Введите название игры',
    );
  }
}
