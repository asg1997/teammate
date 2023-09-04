import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/pagination_notifier/pagination_state.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/cities/presentation/cities_dropdown.dart';
import 'package:teammate/feachers/cities/providers/get_current_city_provider.dart';
import 'package:teammate/feachers/game/entities/game.dart';
import 'package:teammate/feachers/create_game/presentation/create_game/create_game_page.dart';
import 'package:teammate/feachers/create_game/presentation/game_info/game_page.dart';
import 'package:teammate/feachers/create_game/presentation/games/components/games_list_view.dart';
import 'package:teammate/feachers/create_game/presentation/games/providers/get_games_for_city_provider.dart';
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
                      onCityChanged: (_) {},
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final cityResult = ref.watch(getCurrentCityProvider);
                          final city = cityResult.asData?.value;
                          if (city == null) return const LoadingWidget();

                          final gamesResult = ref.watch(
                            getGamesForCityProvider(
                              cityResult.asData!.value,
                            ),
                          );
                          return gamesResult.when(
                            data: (games) => _ListView(
                              city: city,
                              games: games,
                              provider: getGamesForCityProvider,
                            ),
                            error: (error, _) => Text(error.toString()),
                            loading: () => const LoadingWidget(),
                            onGoingLoading: (games) {
                              return Column(
                                children: [
                                  _ListView(
                                    city: city,
                                    games: games,
                                    provider: getGamesForCityProvider,
                                  ),
                                  const SizedBox(height: 20),
                                  const LoadingWidget()
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
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

class _ListView extends ConsumerWidget {
  const _ListView({
    required this.games,
    required this.provider,
    required this.city,
  });
  final Games games;
  final PaginationProvider provider;
  final City city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GamesListView(
      games: games,
      onDeleted: (_) {},
      onTap: (game) {
        navigatorKey.currentState?.push(
          MaterialPageRoute<void>(
            builder: (_) => GamePage(game: game),
          ),
        );
      },
      onRefresh: () async {
        // ignore: unused_result
        ref.refresh(provider(city));
      },
      onScrollEnd: () {},
    );
  }
}
