import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/pagination_notifier/pagination_state.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/cities/presentation/cities_dropdown.dart';
import 'package:teammate/feachers/game/entities/game.dart';
import 'package:teammate/feachers/game/presentation/create_game/create_game_page.dart';
import 'package:teammate/feachers/game/presentation/game_info/game_page.dart';
import 'package:teammate/feachers/game/presentation/games/components/games_list_view.dart';
import 'package:teammate/feachers/game/presentation/games/providers/get_games_for_city_provider.dart';
import 'package:teammate/feachers/notifications/presentation/notifications/notifications_page.dart';

class GamesPage extends ConsumerWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarWidget(
          text: SessionData.nickname,
          leading: IconButton(
            onPressed: () => navigatorKey.currentState?.push(
              MaterialPageRoute<void>(
                builder: (_) => const NotificationsPage(),
              ),
            ),
            icon: const Icon(
              Icons.notifications_on_outlined,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: AppColors.background,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFFF564B),
          onPressed: () => navigatorKey.currentState?.push(
            MaterialPageRoute<void>(
              maintainState: false,
              builder: (_) => const CreateGamePage(),
            ),
          ),
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    CitiesDropdown(
                      // TODO:
                      onCityChanged: (_) {},
                    ),
                    const SizedBox(height: 16),
                    const Expanded(child: _GamesListView()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GamesListView extends ConsumerStatefulWidget {
  const _GamesListView();

  @override
  ConsumerState<_GamesListView> createState() => _ListViewState();
}

class _ListViewState extends ConsumerState<_GamesListView> {
  // void updateGames(Games games) => setState(() {
  //       _games = games;
  //     });

  @override
  Widget build(BuildContext context) {
    final gamesResult = ref.watch(getGamesForCityProvider);
    final isLoading = gamesResult.maybeWhen(
      loading: () => true,
      orElse: (_) => false,
    );
    if (isLoading) return const LoadingWidget();
    final games = gamesResult.maybeWhen(
      data: (items) => items,
      onGoingLoading: (items) => items,
      orElse: (_) => <Game>[],
    );
    final isLoadingMore = gamesResult.maybeWhen(
      onGoingLoading: (_) => true,
      orElse: (_) => false,
    );
    return Column(
      children: [
        GamesListView(
          games: games,
          onDeleted: (_) {},
          onTap: (game) => navigatorKey.currentState?.push(
            MaterialPageRoute<void>(
              builder: (_) => GamePage(game: game),
            ),
          ),
          // ignore: unused_result
          onRefresh: () async => ref.refresh(getGamesForCityProvider),
          onScrollEnd: () {},
        ),
        if (isLoadingMore) ...[
          const SizedBox(height: 20),
          const LoadingWidget(),
        ],
      ],
    );
  }
}
