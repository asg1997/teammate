import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/auth/presentation/registration_screen/presentation/cubit/registration_screen_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationScreenCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: AppDecProp.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainAppBarWidget(title: 'Регистрация'),
            const SizedBox(height: 20),

            // TF EMAIL
            TextFieldWidget(
              title: 'E-mail',
              onChanged: model.onEmailChanged,
            ),
            const SizedBox(height: 10),

            // TF PASSWORD
            TextFieldWidget(
              title: 'Пароль',
              onChanged: model.onPasswordChanged,
            ),

            const SizedBox(height: 71),

            // BUTTON LOG IN
            Center(
              child: AppButton(
                title: 'Далее',
                onTap: () => model.onNextTapped(context),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
