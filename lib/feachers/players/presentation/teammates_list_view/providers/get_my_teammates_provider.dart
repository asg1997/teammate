import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/players/data/providers/teammates_repo_provider.dart';

final getMyTeammatesProvider = FutureProvider.autoDispose((ref) {
  final teammatesRepo = ref.watch(teammatesRepoProvider);
  return teammatesRepo.getMyTeammates();
});
