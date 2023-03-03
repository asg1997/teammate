import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';

import 'package:teammate/domain/entities/user.dart';

class PlayersListView extends StatelessWidget {
  const PlayersListView({super.key, required this.players});
  final List<User> players;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppDecProp.defaultBorderRadius,
        color: Colors.white,
      ),
      child: players.isEmpty
          ? Center(
              child: Text(
                'Пока нет участников',
                style: AppFonts.bodySmall,
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
  final User player;
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
