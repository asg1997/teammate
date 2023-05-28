import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/loading_widget.dart';

import 'package:teammate/presentation/auth/auth_screen/cubit/auth_screen_cubit.dart';
import 'package:teammate/presentation/auth/otp_screen/components/pinput_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthScreenCubit>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const MainAppBarWidget(title: 'Введите код'),
        body: SafeArea(
          child: Padding(
            padding: AppDecorations.defaultPadding.copyWith(top: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<AuthScreenCubit, AuthScreenState>(
                  builder: (context, state) {
                    return Text(
                      'Введите код, отправленный на номер \n\n+7${state.phone}',
                      textAlign: TextAlign.center,
                      style: AppFonts.button,
                    );
                  },
                ),
                const SizedBox(height: 20),
                PinputWidget(
                  onComplited: model.onPinPutCompleted,
                ),
                BlocBuilder<AuthScreenCubit, AuthScreenState>(
                  builder: (context, state) {
                    if (state.isCheckingCode) {
                      return Column(
                        children: const [
                          SizedBox(height: 40),
                          LoadingWidget(),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
                // ОШИБКА
                BlocBuilder<AuthScreenCubit, AuthScreenState>(
                  buildWhen: (previous, current) =>
                      previous.otpErrorMsg != current.otpErrorMsg ||
                      current.isCheckingCode != previous.isCheckingCode,
                  builder: (context, state) {
                    if (state.isCheckingCode) return Container();
                    return Column(
                      children: [
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.otpErrorMsg,
                            style:
                                AppFonts.medium14.copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
