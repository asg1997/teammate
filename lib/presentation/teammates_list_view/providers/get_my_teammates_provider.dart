import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/data/moduls/teammates_repo_provider.dart';

final getMyTeammatesProvider = FutureProvider.autoDispose((ref) {
  final teammatesRepo = ref.watch(teammatesRepoProvider);
  return teammatesRepo.getMyTeammates();
});
