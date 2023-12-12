import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';
import 'package:teammate/feachers/game/presentation/share_game_pop_up/share_game_pop_up.dart';

class ShareGameButton extends ConsumerWidget {
  const ShareGameButton(this.game, {super.key});
  final Game game;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => showModalBottomSheet<void>(
          context: context,
          backgroundColor: AppColors.background,
          builder: (_) {
            return ShareGamePopUp(
              game: game,
            );
          },
        ),
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
