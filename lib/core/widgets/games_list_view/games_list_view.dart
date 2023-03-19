import 'package:flutter/material.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/core/widgets/games_list_view/games_list_view_item.dart';

import 'package:teammate/domain/entities/game/game.dart';

class GamesListView extends StatefulWidget {
  const GamesListView({
    required this.games,
    this.onBottom,
    this.onGameSelected,
    super.key,
    this.shrinkWrap = false,
  });

  final List<Game> games;
  final void Function(Game game)? onGameSelected;
  final bool shrinkWrap;
  final VoidCallback? onBottom;

  @override
  State<GamesListView> createState() => _GamesListViewState();
}

class _GamesListViewState extends State<GamesListView> {
  final _controller = ScrollController();

  void _onEdgeListener() {
    if (_controller.position.atEdge && _controller.position.pixels != 0) {
      widget.onBottom?.call();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onEdgeListener);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onEdgeListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _controller,
      padding: EdgeInsets.zero,
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.games.length,
      itemBuilder: (_, index) => GamesListViewItem(
        game: widget.games[index],
        onTap: () {
          widget.onGameSelected != null
              ? widget.onGameSelected!(widget.games[index])
              : navigatorKey.currentState?.pushNamed(
                  AppRoutes.gameInfo,
                  arguments: widget.games[index],
                );
        },
      ),
      separatorBuilder: (_, index) => const SizedBox(height: 10),
    );
  }
}
