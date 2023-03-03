import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/games_list_view/games_list_view.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/search_game/presentation/search_game_screen/cubit/search_game_screen_cubit.dart';

import '../../../../core/bloc_utils/base_status.dart';
import '../../../../core/consts/app_decorations_prop.dart';

class SearchGameScreen extends StatelessWidget {
  const SearchGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDecProp.defaultPadding,
          child: Column(
            children: const [
              // ПОИСК ИГР
              MainAppBarWidget(title: 'Поиск игр'),
              SizedBox(height: 30),

              // ПОИСК
              SearchTextField(),
              SizedBox(height: 40),

              // ЛИСТВЬЮ С ИГРАМИ
              Expanded(
                child: _ListView(),
              ),
            ],
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
    final model = context.read<SearchGameScreenCubit>();
    return BlocBuilder<SearchGameScreenCubit, SearchGameScreenState>(
      builder: (context, state) {
        switch (state.status) {
          case BaseStatus.loading:
            return const LoadingWidget();
          case BaseStatus.loaded:
            if (state.games.isEmpty) {
              return const Center(
                child: Text(
                    'По заданному фильтру игры не найдены. Попробуйте изменить поиск'),
              );
            } else {
              return GamesListView(
                games: state.games,
                onGameSelected: (game) => model.onGameTapped(context, game),
              );
            }
          case BaseStatus.error:
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
