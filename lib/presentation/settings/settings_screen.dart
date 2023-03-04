import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/presentation/auth/registration_info_screen/components/city_dropdown.dart';

import 'package:teammate/presentation/settings/cubit/settings_screen_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SettingsScreenCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.defaultPadding,
          child: Column(
            children: [
              // НАСТРОЙКИ
              const MainAppBarWidget(title: 'Настройки'),
              const SizedBox(height: 30),

              // НИКНЕЙ
              TextFieldWidget(
                title: 'Никнейм',
                onChanged: model.onNickChanged,
              ),
              const SizedBox(height: 10),

              // ВЫБОР ГОРОДА
              CityDropdownWidget(
                onChanged: model.onCityChanged,
              ),
              const SizedBox(height: 71),

              // СОХРАНИТЬ КНОПКУ
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
    required this.title,
    required this.onTapped,
  });
  final String title;
  final VoidCallback onTapped;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: AppDecorations.defaultBorderRadius,
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
