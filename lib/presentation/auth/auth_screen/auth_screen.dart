import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/presentation/auth/auth_screen/components/phone_tf.dart';
import 'package:teammate/presentation/auth/auth_screen/cubit/auth_screen_cubit.dart';
import 'package:teammate/resources/resources.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthScreenCubit>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: AppDecorations.defaultPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // ТЕКСТ АВТОРИЗАЦИЯ
                Text(
                  'Вход',
                  style: AppFonts.bold20,
                ),
                const SizedBox(height: 30),
                // ТЕЛЕФОН
                PhoneTextField(
                  onChanged: model.onPhoneChanged,
                ),

                // ОШИБКА
                BlocBuilder<AuthScreenCubit, AuthScreenState>(
                  buildWhen: (previous, current) =>
                      previous.loginErrorMsg != current.loginErrorMsg,
                  builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.loginErrorMsg,
                            style:
                                AppFonts.medium14.copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 24),

                // BUTTON LOG IN
                BlocBuilder<AuthScreenCubit, AuthScreenState>(
                  buildWhen: (previous, current) =>
                      previous.isRequestingCode != current.isRequestingCode,
                  builder: (context, state) {
                    return AppButton(
                      isLoading: state.isRequestingCode,
                      title: 'Войти',
                      onTap: () => model.onAuthorizeTapped(context),
                    );
                  },
                ),

                const SizedBox(height: 36),

                const Spacer(),
                // VK
                _LogInVK(
                  onTap: () => model.onVkTapped(context),
                ),
              ],
            ),
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
        const SizedBox(width: 15),
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
