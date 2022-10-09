import 'package:flutter/material.dart';

import '../../../feachers/game/domain/entites/game.dart';
import 'games_list_view_item.dart';

class GamesListView extends StatelessWidget {
  const GamesListView({
    Key? key,
    required this.games,
    required this.onGameSelected,
    this.shrinkWrap = false,
  }) : super(key: key);

  final List<Game> games;
  final Function(Game game) onGameSelected;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: shrinkWrap,
      itemCount: games.length,
      itemBuilder: (_, index) => GamesListViewItem(
        game: games[index],
        onTap: () => onGameSelected(games[index]),
      ),
      separatorBuilder: (_, index) => const SizedBox(height: 10),
    );
  }
}
