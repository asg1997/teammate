import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/feachers/game/entities/game.dart';
import 'package:teammate/feachers/game/presentation/share_game_pop_up/providers/share_social_provider.dart';
import 'package:teammate/feachers/game/presentation/share_game_pop_up/providers/share_with_teammates_provider.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';
import 'package:teammate/feachers/players/presentation/teammates_list_view/teammates_list_view.dart';

class ShareGamePopUp extends ConsumerWidget {
  const ShareGamePopUp({
    required this.game,
    super.key,
  });

  final Game game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var playersToInvite = <Player>[];
    return SafeArea(
      top: false,
      child: Padding(
        padding: AppDecorations.defaultPadding.copyWith(top: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Center(
                    child: Text(
                      'Пригласить друзей',
                      style: AppFonts.medium18.copyWith(color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _ShareSocialButton(
                      onTap: () {
                        ref.read(shareSocialProvider(game));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TeammatesListView(
                  shrinkWrap: true,
                  selectionMode: true,
                  selectedPlayers: (players) {
                    playersToInvite = players;
                  },
                ),
              ),
              const SizedBox(height: 20),
              MainButton(
                width: double.infinity,
                title: 'Пригласить',
                onTap: () {
                  ref.read(shareWithTeammatesProvider(playersToInvite));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShareSocialButton extends ConsumerWidget {
  const _ShareSocialButton({
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: const Icon(
        Icons.ios_share_outlined,
        color: Colors.white,
      ),
    );
  }
}
