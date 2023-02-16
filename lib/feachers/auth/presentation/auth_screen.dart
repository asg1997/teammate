import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/auth/presentation/cubit/auth_screen_cubit.dart';
import 'package:teammate/resources/resources.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthScreenCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: AppDecProp.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ТЕКСТ АВТОРИЗАЦИЯ
            Center(
              child: Text(
                'Авторизация',
                style: AppFonts.bold20,
              ),
            ),
            const SizedBox(height: 30),

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

            // BUTTON FORGOT PASSWORD
            _TextButtonWidget(
              onPressed: () => model.onRecovedPasswordTapped(context),
              style: AppFonts.regular15,
              text: 'Забыли пароль?',
            ),
            const SizedBox(height: 40),

            // BUTTON LOG IN
            Center(
              child: AppButton(
                title: 'Войти',
                onTap: () => model.onLogInTapped(context),
              ),
            ),

            const SizedBox(height: 30),

            // BUTTON REGISTATION
            Center(
              child: _TextButtonWidget(
                onPressed: () => model.onRegistrationTapped(context),
                style: AppFonts.tfMedium14,
                text: 'РЕГИСТРАЦИЯ',
              ),
            ),

            Expanded(child: Container()),

            // VK
            _LogInVK(
              onTap: () => model.onVkTapped(context),
            )
          ],
        ),
      )),
    );
  }
}

class _LogInVK extends StatelessWidget {
  const _LogInVK({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.vk),
        const SizedBox(width: 18),
        Material(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onTap,
            child: Text(
              'Войти через Вконтакте',
              style: AppFonts.regular15.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class _TextButtonWidget extends StatelessWidget {
  const _TextButtonWidget(
      {required this.onPressed, required this.text, required this.style});

  final VoidCallback onPressed;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
