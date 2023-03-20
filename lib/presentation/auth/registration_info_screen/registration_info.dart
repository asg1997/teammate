import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/utils/base_status.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/dropdown_text_field.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/presentation/auth/registration_info_screen/cubit/registration_info_screen_cubit.dart';

class RegistrationInfoScreen extends StatelessWidget {
  const RegistrationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationInfoScreenCubit>();
    return BlocBuilder<RegistrationInfoScreenCubit,
        RegistrationInfoScreenState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: const MainAppBarWidget(
              title: 'Ваши данные',
              hasBackButton: false,
            ),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: AppDecorations.defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ВАШИ ДАННЫЕ

                    if (state.status == BaseStatus.loading) ...[
                      const Expanded(child: Center(child: LoadingWidget()))
                    ] else ...[
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
                        denyRules: RegExp(r'\s|[а-я]'),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Город*',
                        style: AppFonts.medium14,
                      ),
                      const SizedBox(height: 10),
                      CitiesSearchTextField(
                        items: state.cities,
                        onChanged: model.onCityChanged,
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
                      // CityDropdownWidget(
                      //   onChanged: model.onCityChanged,
                      // ),
                      if (state.errorText.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            state.errorText,
                            style: const TextStyle(color: AppColors.main),
                          ),
                        ),
                      ],

                      const SizedBox(height: 36),

                      // КНОПКА СОХРАНИТЬ
                      Center(
                        child: MainButton(
                          title: 'Сохранить',
                          isLoading: state.isRegistering,
                          onTap: () => model.onSaveTapped(context),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
