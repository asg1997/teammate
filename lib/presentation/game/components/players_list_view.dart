import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/player.dart';
import 'package:teammate/presentation/game/providers/game_teammates_provider.dart';
import 'package:teammate/presentation/game/providers/players_count_provider.dart';

class PlayersListView extends ConsumerWidget {
  const PlayersListView({
    required this.game,
    super.key,
  });
  final Game game;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(getPlayersForGameProvider(game.id));
    final playersCount = ref.watch(playersCountProvider(game.id));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // КОЛИЧЕСТВО УЧАСТНИКОВ
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Участники ($playersCount)',
              style: AppFonts.medium18.copyWith(
                color: AppColors.main,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        players.when(
          data: (players) {
            return players.isEmpty
                ? const _EmptyPlayersWidget.text('Пока нет участников')
                : _ContainerWidget(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      itemCount: players.length,
                      itemBuilder: (_, index) =>
                          PlayersListItem(player: players[index]),
                      separatorBuilder: (_, index) => const Divider(
                        color: Color.fromARGB(255, 177, 177, 177),
                      ),
                    ),
                  );
          },
          error: (_, __) {
            return const _EmptyPlayersWidget.text(
              'Произошла ошибка, попробуйте позже',
            );
          },
          loading: _EmptyPlayersWidget.loading,
        ),
      ],
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
      height: 25,
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

class _EmptyPlayersWidget extends StatelessWidget {
  const _EmptyPlayersWidget._({required String text, required bool isLoading})
      : _text = text,
        _isLoading = isLoading;
  const _EmptyPlayersWidget.loading()
      : _text = '',
        _isLoading = true;
  const _EmptyPlayersWidget.text(String text)
      : _text = text,
        _isLoading = false;

  final bool _isLoading;
  final String _text;
  @override
  Widget build(BuildContext context) {
    return _ContainerWidget(
      child: _isLoading
          ? const LoadingWidget()
          : Text(
              _text,
              style: AppFonts.regular14,
            ),
    );
  }
}

class _ContainerWidget extends StatelessWidget {
  const _ContainerWidget({
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: AppDecorations.defaultBorderRadius,
        color: Colors.white,
      ),
      child: child,
    );
  }
}
