import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/presentation/game_info/components/teammetes_list_view.dart';
import 'package:teammate/presentation/game_info/cubit/game_info_cubit.dart';

class GameInfoScreen extends StatelessWidget {
  const GameInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameInfoCubit, GameInfoState>(
      builder: (context, state) {
        final model = context.read<GameInfoCubit>();
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              state.game.gameInfo.name,
              style: AppFonts.titleLarge,
            ),
            actions: state.isMyGame
                ? [
                    // КНОПКА РЕДАКТИВНОВАНИЯ
                    IconButton(
                      onPressed: model.onEditTapped,
                      icon: const Icon(Icons.edit),
                    )
                  ]
                : null,
          ),
          backgroundColor: AppColors.secondaryBg,
          body: SafeArea(
            child: Padding(
              padding: AppDecorations.defaultPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // СПОРТ
                    Text(
                      'Вид спорта',
                      style: AppFonts.medium14.copyWith(
                        color: AppColors.main,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      state.game.gameInfo.sport.localized,
                      style: AppFonts.bodyLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Город
                    Text(
                      'Город',
                      style: AppFonts.medium14.copyWith(
                        color: AppColors.main,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      state.game.gameInfo.city.name,
                      style: AppFonts.bodyLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Место
                    Text(
                      'Место',
                      style: AppFonts.medium14.copyWith(
                        color: AppColors.main,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      state.game.gameInfo.location,
                      style: AppFonts.bodyLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ВРЕМЯ
                    Text(
                      'Дата и время',
                      style: AppFonts.medium14.copyWith(
                        color: AppColors.main,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      state.gameDateStr,
                      style: AppFonts.bodyLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // КОЛИЧЕСТВО УЧАСТНИКОВ
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Участники (${state.players.length})',
                          style: AppFonts.titleMedium.copyWith(
                            color: AppColors.main,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const _PlayersListView(),
                    const SizedBox(height: 10),
                    // ПОДЕЛИТЬСЯ / ПОЗВАТЬ ДРУЗЕЙ
                    const Align(
                      alignment: Alignment.centerRight,
                      child: _ShareButton(),
                    ),

                    const SizedBox(height: 30),
                    // КНОПКА ПРИСОЕДИНИТЬСЯ / ВЫЙТИ
                    if (!state.isMyGame) ...[
                      MainButton(
                        width: double.infinity,
                        title: model.joinTitle,
                        onTap: model.onJoinToggle,
                        isLoading:
                            state.status == GameInfoStatus.isChangingJoinStatus,
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ShareButton extends StatelessWidget {
  const _ShareButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: context.read<GameInfoCubit>().onInviteUsersTapped,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Позвать друзей',
              style: AppFonts.bodyMedium.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.share_rounded,
              color: AppColors.main,
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayersListView extends StatelessWidget {
  const _PlayersListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameInfoCubit, GameInfoState>(
      builder: (context, state) {
        final isLoading = state.status == GameInfoStatus.isLoadingPLayers;

        return SizedBox(
          height: 200,
          child: isLoading
              ? const LoadingWidget()
              : PlayersListView(
                  players: state.players,
                ),
        );
      },
    );
  }
}
