
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/feachers/teammates/domain/repo/teammates_repo.dart';

final teammatesRepoProvider = Provider<TeammatesRepo>((ref) => sl());