import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/data/repo/players_repo.dart';

import 'package:teammate/feachers/game/domain/repo/players_repo.dart';

final playersRepoProvider = Provider<PlayersRepo>((ref) => PlayersRepoImpl());
