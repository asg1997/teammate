import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/pagination_notifier/pagination_state.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/cities/presentation/cities_dropdown.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';
import 'package:teammate/feachers/game/presentation/create_game/create_game_page.dart';
import 'package:teammate/feachers/game/presentation/game_info/game_page.dart';
import 'package:teammate/feachers/game/presentation/game_info/notifiers/delete_game_notifier.dart';
import 'package:teammate/feachers/game/presentation/game_info/notifiers/edit_game_notifier.dart';
import 'package:teammate/feachers/game/presentation/games/components/games_list_view.dart';
import 'package:teammate/feachers/game/presentation/games/providers/get_games_for_city_provider.dart';
import 'package:teammate/feachers/game/presentation/games/providers/selected_city_provider.dart';
import 'package:teammate/feachers/notifications/presentation/notifications_page.dart';

class GamesPage extends ConsumerWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarWidget(
          text: SessionData.nickname,
          leading: const IconButton(
            onPressed: NotificationsPage.push,
            icon: Icon(
              Icons.notifications_on_outlined,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: AppColors.background,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFFF564B),
          onPressed: () async {
            final game = await CreateGamePage.navigate(context);
            if (game == null) return;
            ref.read(getGamesForCityProvider.notifier).pushElement(game);
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CitiesDropdown(
                  onCityChanged: (city) =>
                      ref.read(selectedCityProvider.notifier).state = city,
                ),
                const SizedBox(height: 16),
                const Expanded(child: _GamesListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GamesListView extends ConsumerWidget {
  const _GamesListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesResult = ref.watch(getGamesForCityProvider);

    // игра успешно отредактирована - обновить экран
    ref
      ..listen(editGameNotifierProvider, (_, state) {
        state.whenOrNull(
          success: (_) => ref.refresh(getGamesForCityProvider),
        );
      })
      // игра успешно уделена - обновить экран
      ..listen(deleteGameNotifierProvider, (_, state) {
        state.whenOrNull(
          success: (_) => ref.refresh(getGamesForCityProvider),
        );
      });
    final isLoading = gamesResult.maybeWhen(
      loading: () => true,
      orElse: (_) => false,
    );
    if (isLoading) return const LoadingWidget();
    final games = gamesResult.maybeWhen(
      data: (items) => items,
      onGoingLoading: (items) => items,
      orElse: (_) => <Game>[],
    )..sorted((a, b) => a.dateTime.compareTo(b.dateTime));

    final isLoadingMore = gamesResult.maybeWhen(
      onGoingLoading: (_) => true,
      orElse: (_) => false,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GamesListView(
            games: games,
            onDeleted: (_) {},
            onTap: (game) => GamePage.navigate(context, game: game),
            // ignore: unused_result
            onRefresh: () async => ref.refresh(getGamesForCityProvider),
            onScrollEnd: () =>
                ref.read(getGamesForCityProvider.notifier).fetchNextBatch(),
          ),
        ),
        if (isLoadingMore) ...[
          const SizedBox(height: 20),
          const LoadingWidget(),
        ],
      ],
    );
  }
}
