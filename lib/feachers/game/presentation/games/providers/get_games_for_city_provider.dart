import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/pagination_notifier/pagination_notifier.dart';
import 'package:teammate/core/pagination_notifier/pagination_state.dart';
import 'package:teammate/feachers/game/data/repo/games_repo.dart';
import 'package:teammate/feachers/game/entities/game.dart';
import 'package:teammate/feachers/game/presentation/games/providers/selected_city_provider.dart';

final getGamesForCityProvider = StateNotifierProvider.autoDispose<
    PaginationNotifier<Game>, PaginationState<Game>>(
  (ref) {
    final city = ref.watch(selectedCityProvider);

    return PaginationNotifier(
      fetchNextItems: (_, offset) async {
        if (city == null) return [];
        return ref.read(gamesRepoProvider).getGames(city);
      },
    );
  },
);
