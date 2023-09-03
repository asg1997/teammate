import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/data/nickname_storage.dart';
import 'package:teammate/feachers/auth/data/nickname_storage.dart';
import 'package:teammate/feachers/auth/presentation/notifiers/nickname_state.dart';

class NicknameNotifier extends StateNotifier<NicknameState> {
  NicknameNotifier({
    required this.nicknameRepo,
  }) : super(const NicknameState.initial());
  final NicknameStorage nicknameRepo;

  Future<void> onSubmit(String name) async {
    if (name.isEmpty) {
      state = const NicknameState.error('Поле не должно быть пуcтым');
    }

    try {
      state = const NicknameState.loading();
      await nicknameRepo.saveUser(name);
      state = const NicknameState.success();
    } catch (e) {
      state = NicknameState.error(e.toString());
    }
  }
}
