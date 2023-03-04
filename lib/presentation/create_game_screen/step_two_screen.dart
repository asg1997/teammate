import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/presentation/create_game_screen/components/time_dropdown.dart';

import 'package:teammate/presentation/create_game_screen/cubit/create_game_cubit.dart';
import 'package:teammate/resources/resources.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<CreateGameCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.defaultPadding,
          child: Column(
            children: [
              BlocBuilder<CreateGameCubit, CreateGameState>(
                builder: (context, state) {
                  return MainAppBarWidget(title: state.sport.name());
                },
              ),
              const SizedBox(height: 70),
              Image.asset(AppImages.step2),
              const SizedBox(height: 70),

              const DatePickerWidget(
                text: 'Дата и время*',
              ),
              const SizedBox(height: 71),
              // КНОПКА СОХРАНИТЬ
              AppButton(
                title: 'Далее',
                onTap: () => model.onNextThreeTapped(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
