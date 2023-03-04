import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/dropdown_text_field.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/presentation/auth/registration_info_screen/components/city_dropdown.dart';
import 'package:teammate/presentation/auth/registration_info_screen/cubit/registration_info_screen_cubit.dart';

class RegistrationInfoScreen extends StatelessWidget {
  const RegistrationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationInfoScreenCubit>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: AppDecorations.defaultPadding,
            child: Column(
              children: [
                // ВАШИ ДАННЫЕ
                const MainAppBarWidget(
                  title: 'Ваши данные',
                  hasBackButton: false,
                ),
                const SizedBox(height: 20),

                // // ИМЯ
                // TextFieldWidget(
                //   title: 'Имя*',
                //   onChanged: model.onNameChanged,
                // ),
                // const SizedBox(height: 10),

                // НИК
                TextFieldWidget(
                  title: 'Ник*',
                  hint: 'Придумайте ник',
                  onChanged: model.onNickChanged,
                ),
                const SizedBox(height: 10),
                const CitySearch(
                  cities: [
                    'New York',
                    'Los Angeles',
                    'Chicago',
                    'Houston',
                    'Phoenix',
                    'Philadelphia',
                    'San Antonio',
                    'San Diego',
                    'Dallas',
                    'San Jose',
                  ],
                  onChanged: print,
                ),
                // // ДАТА РОЖДЕНИЯ
                // const TextFieldWidget(
                //   title: 'Дата рождения*',
                //   // ДАТУ РОЖДЕНИЯ ОБРАБОТАТЬ
                // ),
                // const SizedBox(height: 10),

                // const GenderDropdownWidget(),
                // const SizedBox(height: 10),

                // ВЫБОР ГОРОДА
                CityDropdownWidget(
                  onChanged: model.onCityChanged,
                ),
                const SizedBox(height: 71),

                // КНОПКА СОХРАНИТЬ
                AppButton(
                  title: 'Сохранить',
                  onTap: () => model.onSaveTapped(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
