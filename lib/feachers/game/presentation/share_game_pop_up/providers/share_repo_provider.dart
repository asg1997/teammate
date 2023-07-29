import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/feachers/game/data/repo/share_repo.dart';
import 'package:teammate/feachers/game/domain/repo/share_repo.dart';

final shareRepoProvider =
    Provider.autoDispose<ShareRepo>((_) => ShareRepoImpl());
