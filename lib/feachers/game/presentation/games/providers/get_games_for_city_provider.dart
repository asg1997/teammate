import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/pagination_notifier/pagination_notifier.dart';
import 'package:teammate/core/pagination_notifier/pagination_state.dart';
import 'package:teammate/feachers/game/data/games_fetcher.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';
import 'package:teammate/feachers/game/presentation/games/providers/selected_city_provider.dart';

final getGamesForCityProvider = StateNotifierProvider.autoDispose<
    PaginationNotifier<Game>, PaginationState<Game>>(
  (ref) {
    final city = ref.watch(selectedCityProvider);

    return PaginationNotifier(
      fetchNextItems: (_, offset) async {
        final games = await ref.read(gamesRepoProvider).getGames(
              city,
              offset: offset,
            );
        return games;
      },
    );
  },
);
