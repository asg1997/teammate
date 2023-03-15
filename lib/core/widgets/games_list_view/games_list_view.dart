import 'package:flutter/material.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/core/widgets/games_list_view/games_list_view_item.dart';

import 'package:teammate/domain/entities/game/game.dart';

class GamesListView extends StatelessWidget {
  const GamesListView({
    required this.games,
    this.onGameSelected,
    super.key,
    this.shrinkWrap = false,
  });

  final List<Game> games;
  final void Function(Game game)? onGameSelected;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: shrinkWrap,
      itemCount: games.length,
      itemBuilder: (_, index) => GamesListViewItem(
        game: games[index],
        onTap: () {
          onGameSelected != null
              ? onGameSelected!(games[index])
              : navigatorKey.currentState?.pushNamed(
                  AppRoutes.gameInfo,
                  arguments: games[index],
                );
        },
      ),
      separatorBuilder: (_, index) => const SizedBox(height: 10),
    );
  }
}
