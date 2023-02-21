import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/feachers/auth/presentation/auth_screen/presentation/cubit/auth_screen_cubit.dart';
import 'package:teammate/feachers/auth/presentation/components/phone_tf.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            // ТЕКСТ АВТОРИЗАЦИЯ
            Text(
              'Авторизация',
              style: AppFonts.bold20,
            ),
            const SizedBox(height: 30),

            PhoneTextFieldWidget(onChanged: model.onPhoneChanged),
            const _ErrorWidget(),

            const SizedBox(height: 71),

            // BUTTON LOG IN
            AppButton(
              title: 'Войти',
              onTap: () => model.onOtpScreen(context),
            ),

            const SizedBox(height: 30),

            // BUTTON REGISTATION
            _TextButtonWidget(
              onPressed: () => model.onRegistrationTapped(context),
              style: AppFonts.tfMedium14,
              text: 'РЕГИСТРАЦИЯ',
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

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenCubit, AuthScreenState>(
      builder: (context, state) {
        return state.status == BaseStatus.error
            ? Column(
                children: [
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Неправильно введен номер',
                      style: AppFonts.tfMedium14.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              )
            : Container();
      },
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
