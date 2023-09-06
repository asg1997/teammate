import 'package:flutter/material.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/feachers/game/entities/game.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/games/components/games_list_item.dart';

class GamesListView extends StatelessWidget {
  const GamesListView({
    required this.games,
    required this.onDeleted,
    required this.onTap,
    required this.onRefresh,
    required this.onScrollEnd,
    super.key,
  });

  final List<Game> games;
  final void Function(Game game) onDeleted;
  final void Function(Game game) onTap;
  final Future<void> Function() onRefresh;
  final VoidCallback onScrollEnd;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        final metrics = scrollEnd.metrics;
        final isTop = metrics.pixels == 0;
        if (metrics.atEdge && !isTop) onScrollEnd();
        return true;
      },
      child: RefreshIndicator(
        onRefresh: onRefresh,
        color: AppColors.secondary,
        child: ListView.separated(
          itemCount: games.length,
          itemBuilder: (_, index) {
            final game = games[index];
            return GamesListItem(
              game: game,
              onDeleted: () => onDeleted(game),
              onTap: () => onTap(game),
            );
          },
          separatorBuilder: (_, index) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}
