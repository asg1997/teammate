import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/cities_dropdown.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/core/widgets/sport_dropdown.dart';
import 'package:teammate/presentation/components/show_date_time_picker.dart';
import 'package:teammate/presentation/create_game/create_game_model.dart';

final createGameProvider = ChangeNotifierProvider.autoDispose(
  (ref) => CreateGameModel(sl(), sl()),
);

class CreateGamePage extends ConsumerWidget {
  const CreateGamePage({super.key});

  InputDecoration _decoration(String label, String hint) {
    return InputDecoration(
      focusColor: AppColors.background,
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
        backgroundColor: AppColors.background,
        appBar: const AppBarWidget(
          text: 'Создать игру',
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
                            CitiesDropdown(
                              onCityChanged: model.onCityChanged,
                              initialCity: model.city,
                            ),
                            const SizedBox(height: 16),
                            SportDropdown(
                              initialSport: model.sport,
                              onSportChanged: model.onSportChanged,
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
                            const Spacer(),
                            const SizedBox(height: 40),
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.main,
                                ),
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
