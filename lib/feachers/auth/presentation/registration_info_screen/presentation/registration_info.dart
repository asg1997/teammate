import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/auth/presentation/registration_info_screen/presentation/components/city_dropdown.dart';
import 'package:teammate/feachers/auth/presentation/registration_info_screen/presentation/cubit/registration_info_screen_cubit.dart';

class RegistrationInfoScreen extends StatelessWidget {
  const RegistrationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationInfoScreenCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: AppDecProp.defaultPadding,
        child: Column(
          children: [
            // ВАШИ ДАННЫЕ
            const MainAppBarWidget(title: 'Ваши данные'),
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
              onChanged: model.onNickChanged,
            ),
            const SizedBox(height: 10),

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
      )),
    );
  }
}
