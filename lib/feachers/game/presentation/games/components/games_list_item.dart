import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_fonts.dart';

import 'package:teammate/feachers/game/domain/entities/game.dart';

import 'package:teammate/feachers/game/domain/entities/sport.dart';
import 'package:teammate/resources/resources.dart';
import 'package:teammate/service/date_extension.dart';

class GamesListItem extends StatelessWidget {
  const GamesListItem({
    required this.game,
    required this.onDeleted,
    required this.onTap,
    super.key,
  });

  final Game game;
  final VoidCallback onDeleted;
  final VoidCallback onTap;

  void _showMenu(BuildContext context, LongPressStartDetails details) {
    if (!game.isMy) return;
    final offset = details.globalPosition;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      items: [
        PopupMenuItem<void>(
          onTap: onDeleted,
          child: const Text(
            'Удалить игру',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  String get _assetName {
    switch (game.sport) {
      case Sport.soccer:
        return AppImages.footballIc;
      case Sport.basketball:
        return AppImages.basketballIc;
      case Sport.volleyball:
        return AppImages.volleyballIc;
    }
  }

  @override
  Widget build(BuildContext context) {
    final day = game.dateTime.toDayString;
    final time = DateFormat('HH:mm').format(game.dateTime);
    final name = game.isMy ? '${game.name} (вы)' : game.name;

    return GestureDetector(
      onTap: onTap,
      onLongPressStart: (details) => _showMenu(context, details),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1152588F),
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(_assetName),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppFonts.medium16,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Место: ${game.location}',
                    style: AppFonts.light13,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 9),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  day,
                  style: AppFonts.regular14.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  time,
                  style: AppFonts.regular14.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(3),
      //   ),
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 20,
      //     vertical: 15,
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           // ДАТА
      //           Expanded(
      //             child: Text(
      //               date,
      //               style: const TextStyle(fontSize: 16),
      //             ),
      //           ),
      //           // СПОРТ
      //           Text(
      //             game.sport.locale,
      //             style: const TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),

      //       // ОПИСАНИЕ
      //       const SizedBox(height: 20),
      //       if (game.description != null && game.description!.isNotEmpty) ...[
      //         Text(game.description!),
      //         const SizedBox(height: 10),
      //       ],
      //       // Место
      //       Text(game.location),
      //       const SizedBox(height: 10),

      //       // ИМЯ
      //       Align(
      //         alignment: Alignment.bottomRight,
      //         child: Text(
      //           name,
      //           style: const TextStyle(fontSize: 16),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       // ТЕЛЕФОН
      //       Align(
      //         alignment: Alignment.centerRight,
      //         child: Text(
      //           game.phone,
      //           style: const TextStyle(fontSize: 16),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
