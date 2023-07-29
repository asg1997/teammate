import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/auth/presentation/nickname/nickname_model.dart';

final nicknamePageProvider =
    Provider((ref) => NicknamePageModel(nicknameRepo: sl()));

class NicknamePage extends ConsumerWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      ref.read(nicknamePageProvider).name = value,
                  title: 'Придумайте никнейм',
                  hint: 'никнейм',
                ),
                const SizedBox(height: 20),
                MainButton(
                  title: 'Сохранить',
                  onTap: ref.read(nicknamePageProvider).onSubmit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
