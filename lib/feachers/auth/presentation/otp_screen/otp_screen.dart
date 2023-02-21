import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/feachers/auth/presentation/components/pinput_widget.dart';
import 'package:teammate/feachers/auth/presentation/otp_screen/cubit/otp_screen_cubit.dart';
import 'package:teammate/resources/resources.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<OtpScreenCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: AppDecProp.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MainAppBarWidget(title: 'Введите код'),
            const SizedBox(height: 20),

            Text(
              'Введите код, отправленный на номер \n+79605997355',
              textAlign: TextAlign.center,
              style: AppFonts.button,
            ),

            const SizedBox(height: 20),

            PinputWidget(onComplited: (String pin) {}),

            const SizedBox(height: 71),

            // BUTTON LOG IN
            AppButton(
                title: 'Войти', onTap: () => model.onLogInTapped(context)),
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
