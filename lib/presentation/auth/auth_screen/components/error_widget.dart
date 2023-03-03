import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/utils/base_status.dart';
import 'package:teammate/presentation/auth/auth_screen/cubit/auth_screen_cubit.dart';

class AuthErrorWidget extends StatelessWidget {
  const AuthErrorWidget({super.key});

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
                      state.errorMsg,
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
