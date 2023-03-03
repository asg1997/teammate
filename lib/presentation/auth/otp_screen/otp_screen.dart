import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/presentation/auth/auth_screen/components/error_widget.dart';
import 'package:teammate/presentation/auth/auth_screen/cubit/auth_screen_cubit.dart';
import 'package:teammate/presentation/auth/components/pinput_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
              const MainAppBarWidget(title: 'Введите код'),
              const SizedBox(height: 20),
              BlocBuilder<AuthScreenCubit, AuthScreenState>(
                builder: (context, state) {
                  return Text(
                    'Введите код, отправленный на номер \n+7${state.phone}',
                    textAlign: TextAlign.center,
                    style: AppFonts.button,
                  );
                },
              ),
              const SizedBox(height: 20),
              PinputWidget(
                onComplited: (pin) => model.onPinPutCompleted(context, pin),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: AuthErrorWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
