import 'package:flutter/material.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/core/widgets/app_button.dart';

class CreateGameScreen extends StatelessWidget {
  const CreateGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Создать: ',
          style: AppFonts.titleLarge,
        ),
      ),
      backgroundColor: AppColors.secondaryBg,
      body: SafeArea(
        child: Padding(
          padding: AppDecProp.defaultPadding,
          child: Column(
            children: [
              const TextFieldWidget(
                title: 'Название*',
              ),
              const SizedBox(height: 20),
              const TextFieldWidget(
                title: 'Дата и время*',
              ),
              const SizedBox(height: 40),
              const TextFieldWidget(
                title: 'Город*',
              ),
              const SizedBox(height: 20),
              const TextFieldWidget(
                title: 'Место*',
              ),
              Expanded(child: Container()),
              AppButton(
                title: 'Сохранить',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
