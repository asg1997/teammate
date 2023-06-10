import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teammate/app_decorations.dart';
import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/data/cities.dart';
import 'package:teammate/models/sport.dart';
import 'package:teammate/presentation/components/show_date_time_picker.dart';
import 'package:teammate/presentation/create_game/create_game_model.dart';

final createGameProvider = ChangeNotifierProvider.autoDispose(
  (ref) => CreateGameModel(),
);

class CreateGamePage extends ConsumerWidget {
  CreateGamePage({Key? key}) : super(key: key);

  final List<DropdownMenuItem<Sport>> _sportItems = Sport.values
      .map((e) => DropdownMenuItem<Sport>(
            value: e,
            child: Text(e.locale),
          ))
      .toList();

  final List<DropdownMenuItem<String>> _cities = cities
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();

  InputDecoration _decoration(String label, String hint) {
    return InputDecoration(
      focusColor: AppDecorations.background,
      focusedBorder: const OutlineInputBorder(),
      errorBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      border: const OutlineInputBorder(),
      labelText: label,
      hintText: hint,
      fillColor: Colors.white,
      errorStyle: const TextStyle(color: Colors.red),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(createGameProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppDecorations.background,
        appBar: AppBar(
          backgroundColor: AppDecorations.background,
          centerTitle: true,
          title: const Text('Создать игру'),
        ),
        body: model.isLoading
            ? const LoadingWidget()
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            CustomDropdown<String>(
                              value: model.city,
                              items: _cities,
                              hint: const Text('Город*'),
                              onChanged: (value) {
                                if (value != null) model.onCityChanged(value);
                              },
                            ),

                            const SizedBox(height: 16),
                            CustomDropdown<Sport>(
                              value: model.sport,
                              items: _sportItems,
                              hint: const Text('Спорт*'),
                              onChanged: (value) {
                                if (value != null) model.onSportChanged(value);
                              },
                            ),

                            const SizedBox(height: 16),
                            TextField(
                              keyboardType: TextInputType.none,
                              controller: model.dateTextController,
                              decoration: _decoration(
                                'Дата и время*',
                                'Укажите, когда игра',
                              ),
                              onTap: () {
                                showDateTimePicker(
                                  context,
                                  initial: model.dateTime,
                                  onChanged: model.onDateTimeChanged,
                                );
                              },
                            ),
                            // FormBuilderDateTimePicker(
                            //   firstDate: DateTime.now(),
                            //   name: dateTime,
                            //   format: DateFormat('dd MMMM yyyy, HH:mm', 'ru'),
                            //   validator: FormBuilderValidators.required(),
                            //   decoration: _decoration(
                            //     'Дата и время*',
                            //     'Укажите дату игры',
                            //   ),
                            // ),
                            const SizedBox(height: 16),
                            TextField(
                              onChanged: model.onLocationChanged,
                              decoration: _decoration(
                                'Место*',
                                'Укажите, где будете играть',
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              onChanged: model.onDescriptionChanged,
                              maxLines: 10,
                              decoration: _decoration(
                                'Описание',
                                'Например: хотим поиграть 5х5, ищем команду',
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              onChanged: model.onNameChanged,
                              decoration: _decoration(
                                'Имя*',
                                'Как вас зовут',
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              onChanged: model.onPhoneChanged,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '+7 (###) ###-##-##',
                                  filter: {"#": RegExp(r'[0-9]')},
                                )
                              ],
                              decoration: _decoration(
                                'Телефон*',
                                'Укажите телефон, как с вами связаться',
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(height: 40),
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppDecorations.mainColor),
                                onPressed: model.onCreateGameTapped,
                                child: const Text(
                                  'Создать игру',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
