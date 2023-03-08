import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/presentation/game_info/components/teammetes_list_view.dart';
import 'package:teammate/presentation/game_info/model.dart';

class GameInfoScreen extends StatelessWidget {
  const GameInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.read<GameInfoScreenModel>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          model.game.gameInfo.name,
          style: AppFonts.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => model.onEditTapped(context),
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      backgroundColor: AppColors.secondaryBg,
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.defaultPadding,
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
                model.game.gameInfo.sport.localized,
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
                model.game.gameInfo.city.name,
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
                model.game.gameInfo.location,
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
                model.gameDateStr,
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
                    'Участники',
                    style: AppFonts.titleMedium.copyWith(
                      color: AppColors.main,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const _PlayersListView(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Позвать друзей',
                    style: AppFonts.bodyLarge.copyWith(color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: AppColors.main,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayersListView extends StatelessWidget {
  const _PlayersListView();

  @override
  Widget build(BuildContext context) {
    final model = context.read<GameInfoScreenModel>();
    return const SizedBox(height: 200, child: PlayersListView(players: []));
  }
}
