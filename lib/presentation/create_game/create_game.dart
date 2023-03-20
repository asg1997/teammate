import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/presentation/create_game/components/time_dropdown.dart';
import 'package:teammate/presentation/create_game/cubit/create_game_cubit.dart';

class CreateGameScreen extends StatelessWidget {
  const CreateGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<CreateGameCubit>();

    return BlocBuilder<CreateGameCubit, CreateGameState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MainAppBarWidget(title: state.sport.localized),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: AppDecorations.defaultPadding,
              child: Column(
                children: [
                  Stepper(
                    currentStep: state.currentStep,
                    steps: [
                      // Название
                      Step(
                        isActive: state.currentStep == 0,
                        title: const Text('Название'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldWidget(
                              onChanged: model.onNameChanged,
                            ),
                            _ErrorText(state.error),
                          ],
                        ),
                      ),
                      Step(
                        isActive: state.currentStep == 1,
                        title: const Text('Дата и время'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DatePickerWidget(
                              onChanged: model.onDateTimeChanged,
                            ),
                            _ErrorText(state.error),
                          ],
                        ),
                      ),
                      Step(
                        isActive: state.currentStep == 2,
                        title: const Text('Место'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldWidget(
                              title: 'Укажите место*',
                              onChanged: model.onPlaceChanged,
                            ),
                            const SizedBox(height: 10),
                            TextFieldWidget(
                              title: 'Стоимость аренды площадки',
                              onChanged: model.onPriceChanged,
                            ),
                            _ErrorText(state.error),
                          ],
                        ),
                      ),
                    ],
                    controlsBuilder: (context, details) {
                      return Container();
                    },
                  ),
                  // const CreateGameStepProgress(),
                  // Image.asset(AppImages.step1),
                  // const SizedBox(height: 70),
                  // const TextFieldWidget(
                  //   title: 'Название*',
                  // ),

                  // const SizedBox(height: 71),
                  // // КНОПКА СОХРАНИТЬ
                  const Spacer(),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: MainButton(
                          title: 'Назад',
                          onTap: model.onPreviousStep,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: MainButton(
                          isLoading: state.isCreatingGame,
                          title: 'Далее',
                          onTap: model.onNextStep,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ErrorText extends StatelessWidget {
  const _ErrorText(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          text,
          style: AppFonts.medium14.copyWith(color: AppColors.main),
        ),
      ],
    );
  }
}
