import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/pagination_notifier/pagination_notifier.dart';
import 'package:teammate/core/pagination_notifier/pagination_state.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/data/repo/games_repo.dart';
import 'package:teammate/feachers/game/entities/game.dart';

typedef PaginationProvider = AutoDisposeStateNotifierProviderFamily<
    PaginationNotifier<dynamic>, PaginationState<dynamic>, dynamic>;
final getGamesForCityProvider = StateNotifierProvider.autoDispose
    .family<PaginationNotifier<Game>, PaginationState<Game>, City>(
  (ref, city) => PaginationNotifier(
    fetchNextItems: (_, offset) => ref.read(gamesRepoProvider).getGames(city),
  ),
);
