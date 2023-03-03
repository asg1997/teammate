import 'package:flutter/material.dart';
import 'package:teammate/core/widgets/games_list_view/games_list_view_item.dart';
import 'package:teammate/domain/entities/game.dart';

class GamesListView extends StatelessWidget {
  const GamesListView({
    required this.games,
    required this.onGameSelected,
    super.key,
    this.shrinkWrap = false,
  });

  final List<Game> games;
  final void Function(Game game) onGameSelected;
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
