import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/models/player.dart';
import 'package:teammate/presentation/share_game_pop_up/providers/share_repo_provider.dart';

final shareWithTeammatesProvider =
    FutureProvider.family.autoDispose<void, Iterable<Player>>((ref, players) {
  if (players.isEmpty) return;
  ref.read(shareRepoProvider).share(players.map((e) => e.id).toList());
});
