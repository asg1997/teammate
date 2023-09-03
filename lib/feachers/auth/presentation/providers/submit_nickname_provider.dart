import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/presentation/providers/nickname_form_provider.dart';
import 'package:teammate/feachers/auth/presentation/providers/nickname_state_provider.dart';

final submitNicknameProvider = Provider((ref) async {
  final name = ref.watch(nicknameFormProvider);
  await ref.read(nicknameNotifierProvider.notifier).onSubmit(name);
});
