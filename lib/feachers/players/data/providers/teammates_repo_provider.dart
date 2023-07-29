import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/feachers/players/domain/repo/teammates_repo.dart';

final teammatesRepoProvider = Provider<PlayersStorage>((ref) => sl());
