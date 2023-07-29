import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/data/share_repo.dart';
import 'package:teammate/domain/repos/share_repo.dart';

final shareRepoProvider =
    Provider.autoDispose<ShareRepo>((_) => ShareRepoImpl());
