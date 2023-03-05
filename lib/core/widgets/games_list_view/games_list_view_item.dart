import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/domain/entities/game/game.dart';

import 'package:teammate/domain/entities/sport.dart';
import 'package:teammate/resources/resources.dart';

class GamesListViewItem extends StatelessWidget {
  const GamesListViewItem({
    required this.onTap,
    required this.game,
    super.key,
  });

  final VoidCallback onTap;
  final Game game;

  String _getDay() {
    final now = DateTime.now();
    final date = game.gameInfo.dateTime;
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
    final date = game.gameInfo.dateTime;
    return DateFormat('hh:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: AppDecorations.defaultBorderRadius,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // ИКОНКА
              _SportIcon(
                sport: game.gameInfo.sport,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.gameInfo.name,
                    style: AppFonts.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Город: ${game.gameInfo.city}',
                    style: AppFonts.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Место: ${game.gameInfo.location}',
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = _getSportImage();
    if (image.isEmpty) return Container();
    return Image.asset(image);
  }
}
