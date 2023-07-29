import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/data/players_repo.dart';
import 'package:teammate/domain/repos/players_repo.dart';

final playersRepoProvider = Provider<PlayersRepo>((ref) => PlayersRepoImpl());
