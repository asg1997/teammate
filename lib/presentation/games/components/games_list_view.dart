import 'package:flutter/material.dart';

import 'package:teammate/models/game.dart';
import 'package:teammate/presentation/games/components/games_list_item.dart';

class GamesListView extends StatelessWidget {
  const GamesListView({
    required this.games,
    required this.onDeleted,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final List<Game> games;
  final void Function(Game game) onDeleted;
  final void Function(Game game) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: games.length,
      itemBuilder: (_, index) {
        final game = games[index];
        return GamesListItem(
          game: games[index],
          onDeleted: () => onDeleted(game),
          onTap: () => onTap(game),
        );
      },
      separatorBuilder: (_, index) => const SizedBox(height: 10),
    );
  }
}
