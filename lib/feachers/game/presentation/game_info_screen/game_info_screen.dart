import 'package:flutter/material.dart';
import 'package:teammate/feachers/game/presentation/game_info_screen/components/teammetes_list_view.dart';
import '../../../../core/consts/app_colors.dart';
import '../../../../core/consts/app_decorations_prop.dart';
import '../../../../core/consts/app_fonts.dart';

class GameInfoScreen extends StatelessWidget {
  const GameInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'model.game.name',
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
          padding: AppDecProp.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // СПОРТ
              Text(
                'Вид спорта',
                style: AppFonts.tfMedium14.copyWith(
                  color: AppColors.main,
                ),
              ),
              const SizedBox(height: 5),

              Text(
                model.game.sport.name(),
                style: AppFonts.bodyLarge.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Город
              Text(
                'Город',
                style: AppFonts.tfMedium14.copyWith(
                  color: AppColors.main,
                ),
              ),
              const SizedBox(height: 5),

              Text(
                model.game.city,
                style: AppFonts.bodyLarge.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Место
              Text(
                'Место',
                style: AppFonts.tfMedium14.copyWith(
                  color: AppColors.main,
                ),
              ),
              const SizedBox(height: 5),

              Text(
                model.game.location,
                style: AppFonts.bodyLarge.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // ВРЕМЯ
              Text(
                'Дата и время',
                style: AppFonts.tfMedium14.copyWith(
                  color: AppColors.main,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '_dateTimeStr(model.game.dateTime)',
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
                      ))
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
    return const SizedBox(height: 200, child: PlayersListView(players: []));
  }
}
