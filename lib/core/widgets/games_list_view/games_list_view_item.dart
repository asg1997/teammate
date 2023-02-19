import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/resources/resources.dart';

import '../../../feachers/game/domain/entites/game.dart';
import '../../../feachers/game/domain/entites/sport_.dart';

class GamesListViewItem extends StatelessWidget {
  const GamesListViewItem({super.key, required this.game, required this.onTap});
  final Game game;
  final VoidCallback onTap;

  String _getDay() {
    final now = DateTime.now();
    final date = game.dateTime;
    final difference = DateTime(now.year, now.month, now.day)
        .difference(
          DateTime(date.year, date.month, date.day),
        )
        .inDays;
    if (difference == 0) {
      return 'Сегодня';
    } else if (difference == -1) {
      return 'Вчера';
    } else if (difference == 1) {
      return 'Завтра';
    }

    return DateFormat('dd MMMM', 'ru, RU').format(date);
  }

  String _getTime() {
    final date = game.dateTime;
    return DateFormat('hh:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: AppDecProp.defaultBorderRadius,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // ИКОНКА
              _SportIcon(
                sport: game.sport,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.name,
                    style: AppFonts.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Место: ${game.location}',
                    style: AppFonts.bodySmall,
                  )
                ],
              ),
              Expanded(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _getDay(),
                    style: AppFonts.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getTime(),
                    style: AppFonts.bodyMedium,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SportIcon extends StatelessWidget {
  const _SportIcon({required this.sport});
  final Sport sport;

  String _getSportImage() {
    switch (sport) {
      case Sport.football:
        return AppImages.footballIc;
      case Sport.volleyball:
        return AppImages.volleyballIc;
      case Sport.basketball:
        return AppImages.basketballIc;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = _getSportImage();
    if (image.isEmpty) return Container();
    return Image.asset(image);
  }
}
