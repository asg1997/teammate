import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/presentation/create_game_screen/components/time_dropdown.dart';

class EditGameScreen extends StatelessWidget {
  const EditGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.defaultPadding,
          child: Column(
            children: [
              const MainAppBarWidget(title: 'Редактирование игры'),
              const SizedBox(height: 30),
              const TextFieldWidget(
                title: 'Название*',
              ),
              const SizedBox(height: 10),
              const DatePickerWidget(text: 'Дата и время*'),
              const SizedBox(height: 10),
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
                title: 'Сохранить',
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  'УДАЛИТЬ ИГРУ',
                  style: AppFonts.medium16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
