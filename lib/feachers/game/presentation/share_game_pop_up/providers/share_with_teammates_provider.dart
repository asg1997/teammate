import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/data/share_repo.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';

final shareWithTeammatesProvider =
    FutureProvider.family.autoDispose<void, Iterable<Player>>((ref, players) {
  if (players.isEmpty) return;
  ref.read(shareRepoProvider).share(players.map((e) => e.id).toList());
});
