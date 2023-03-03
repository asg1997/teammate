import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/presentation/auth/auth_screen/components/error_widget.dart';
import 'package:teammate/presentation/auth/auth_screen/cubit/auth_screen_cubit.dart';
import 'package:teammate/presentation/auth/components/phone_tf.dart';

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
            children: [
              const SizedBox(height: 10),
              // ТЕКСТ АВТОРИЗАЦИЯ
              Text(
                'Вход',
                style: AppFonts.bold20,
              ),
              const SizedBox(height: 30),

              PhoneTextFieldWidget(onChanged: model.onPhoneChanged),
              const AuthErrorWidget(),

              const SizedBox(height: 71),

              // BUTTON LOG IN
              AppButton(
                title: 'Войти',
                onTap: () => model.onOtpScreen(context),
              ),

              const SizedBox(height: 30),

              Expanded(child: Container()),

              // VK
              _LogInVK(
                onTap: () => model.onVkTapped(context),
              )
            ],
          ),
        ),
      ),
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
