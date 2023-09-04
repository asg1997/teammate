import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/auth/presentation/notifiers/nickname_state.dart';
import 'package:teammate/feachers/auth/presentation/providers/nickname_form_provider.dart';
import 'package:teammate/feachers/auth/presentation/providers/nickname_state_provider.dart';
import 'package:teammate/feachers/auth/presentation/providers/submit_nickname_provider.dart';
import 'package:teammate/feachers/launch/providers/configure_app_proivder.dart';

class NicknamePage extends ConsumerWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(nicknameNotifierProvider, (_, state) {
      state.whenOrNull(
        error: (error) => Fluttertoast.showToast(msg: error),
        success: (nickname) => ref
            .read(appConfigProvider.notifier)
            .configureApp(withNickname: nickname),
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Padding(
            padding: AppDecorations.defaultPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  onChanged: (value) =>
                      ref.read(nicknameFormProvider.notifier).state = value,
                  title: 'Придумайте никнейм',
                  hint: 'никнейм',
                ),
                const SizedBox(height: 20),
                MainButton(
                  title: 'Сохранить',
                  isLoading: ref.watch(nicknameNotifierProvider) ==
                      const NicknameState.loading(),
                  onTap: () => ref.read(submitNicknameProvider),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
