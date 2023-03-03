import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/cubit/create_game_cubit.dart';
import 'package:teammate/resources/resources.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<CreateGameCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: AppDecProp.defaultPadding,
          child: Column(
            children: [
              BlocBuilder<CreateGameCubit, CreateGameState>(
                builder: (context, state) {
                  return MainAppBarWidget(title: state.sport.name());
                },
              ),
              const SizedBox(height: 70),
              Image.asset(AppImages.step3),
              const SizedBox(height: 70),
              const TextFieldWidget(
                title: 'Укажите место*',
              ),
              const SizedBox(height: 10),
              const TextFieldWidget(
                title: 'Стоимость аренды площадки*',
              ),

              const SizedBox(height: 71),
              // КНОПКА СОХРАНИТЬ
              AppButton(
                title: 'Создать',
                onTap: () => model.onSaveTapped(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
