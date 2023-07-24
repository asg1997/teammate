import 'package:flutter/material.dart';

import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';

import 'package:teammate/models/user.dart';

class PlayersListView extends StatelessWidget {
  const PlayersListView({
    required this.players,
    super.key,
  });
  final List<Player> players;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppDecorations.defaultBorderRadius,
        color: Colors.white,
      ),
      child: players.isEmpty
          ? Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              child: Text(
                'Пока нет участников',
                style: AppFonts.regular14,
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: players.length,
              itemBuilder: (_, index) =>
                  PlayersListItem(player: players[index]),
              separatorBuilder: (_, index) => const Divider(
                color: Color.fromARGB(255, 177, 177, 177),
              ),
            ),
    );
  }
}

class PlayersListItem extends StatelessWidget {
  const PlayersListItem({
    required this.player,
    super.key,
  });
  final Player player;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          player.nickname,
          style: AppFonts.bodyMedium.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
