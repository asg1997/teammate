import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/data/nickname_storage.dart';
import 'package:teammate/feachers/auth/presentation/notifiers/nickname_model.dart';
import 'package:teammate/feachers/auth/presentation/notifiers/nickname_state.dart';

final nicknameNotifierProvider =
    StateNotifierProvider<NicknameNotifier, NicknameState>(
  (ref) => NicknameNotifier(nicknameRepo: ref.read(nicknameStorageProvider)),
);
