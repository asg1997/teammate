import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/settings/presentation/settings_screen/cubit/settings_screen_cubit.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../../core/consts/app_decorations_prop.dart';
import '../../../../core/consts/app_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SettingsScreenCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Настройки',
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
                title: 'Никнейм',
              ),
              const SizedBox(height: 10),
              const TextFieldWidget(
                title: 'Город',
              ),
              Expanded(child: Container()),
              AppButton(
                title: 'Сохранить',
                onTap: () => model.onSaveTapped(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    Key? key,
    required this.title,
    required this.onTapped,
  }) : super(key: key);
  final String title;
  final VoidCallback onTapped;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: AppDecProp.defaultBorderRadius,
      child: InkWell(
        onTap: onTapped,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Настройки профиля',
                style: AppFonts.bodyMedium.copyWith(
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
