import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/game/domain/entites/sport_.dart';
import 'package:teammate/feachers/game/presentation/components/save_game_button.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/cubit/create_game_cubit.dart';

class CreateGameScreen extends StatelessWidget {
  const CreateGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<CreateGameCubit>();
    final sport = getLocaleSportName(model.sport);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Создать: $sport',
          style: AppFonts.titleLarge,
        ),
      ),
      backgroundColor: AppColors.secondaryBg,
      body: SafeArea(
        child: Padding(
          padding: AppDecProp.defaultPadding,
          child: Column(
            children: [
              TextFieldWidget(
                title: 'Название*',
                onChanged: model.onNameChanged,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                title: 'Дата и время*',
                onChanged: model.onDateTimeChanged,
              ),
              const SizedBox(height: 40),
              TextFieldWidget(
                title: 'Город*',
                onChanged: model.onCityChanged,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                title: 'Место*',
                onChanged: (value) => model.onDateTimeChanged(value),
              ),
              Expanded(child: Container()),
              SaveGameButton(
                  title: 'Сохранить',
                  onTap: () => model.onSaveGameTapped(context))
            ],
          ),
        ),
      ),
    );
  }
}
