import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/players/data/repo/teammates_repo.dart';

final getMyTeammatesProvider = FutureProvider.autoDispose((ref) {
  final teammatesRepo = ref.watch(teammatesRepoProvider);
  return teammatesRepo.getMyTeammates();
});
