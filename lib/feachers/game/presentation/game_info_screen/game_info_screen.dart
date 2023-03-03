import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/feachers/game/presentation/game_info_screen/components/teammetes_list_view.dart';
import '../../../../core/consts/app_colors.dart';
import '../../../../core/consts/app_decorations_prop.dart';
import '../../../../core/consts/app_fonts.dart';

class GameInfoScreen extends StatelessWidget {
  const GameInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.main,
        child: const Icon(
          Icons.add_reaction_rounded,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'model.game.name',
          style: AppFonts.titleLarge,
        ),
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
                'Спорт',
                style: AppFonts.titleMedium.copyWith(
                  color: AppColors.main,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'getLocaleSportName(model.game.sport)',
                style: AppFonts.bodyLarge.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // ВРЕМЯ
              Text(
                'Дата и время',
                style: AppFonts.titleMedium.copyWith(
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
              const _PlayersListView()
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
