import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teammate/core/teammate_app.dart';

import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/core/widgets/sport_dropdown.dart';
import 'package:teammate/feachers/cities/presentation/cities_dropdown.dart';
import 'package:teammate/feachers/game/entities/sport.dart';
import 'package:teammate/feachers/create_game/presentation/create_game/components/show_date_time_picker.dart';
import 'package:teammate/feachers/create_game/presentation/create_game/models/game_creator_state.dart';
import 'package:teammate/feachers/create_game/presentation/create_game/providers/create_game_form_notifier_provider.dart';
import 'package:teammate/feachers/create_game/presentation/create_game/providers/create_game_provider.dart';
import 'package:teammate/feachers/create_game/presentation/create_game/providers/game_creator_notifier_provider.dart';

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
    ref.listen(gameCreatorNotifierProvider, (_, state) {
      state.whenOrNull(
        error: (msg) => Fluttertoast.showToast(msg: msg),
        success: (game) => navigatorKey.currentState?.pop(game),
      );
    });

    final createGameNotifier =
        ref.read(createGameFormNotifierProvider.notifier);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppBarWidget(
          text: 'Создать игру',
        ),
        body: SafeArea(
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
                        onCityChanged: createGameNotifier.setCity,
                      ),
                      const SizedBox(height: 16),
                      SportDropdown(
                        initialSport: Sport.soccer,
                        onSportChanged: createGameNotifier.setSport,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        keyboardType: TextInputType.none,
                        decoration: _decoration(
                          'Дата и время*',
                          'Укажите, когда игра',
                        ),
                        onTap: () {
                          showDateTimePicker(
                            context,
                            initial: ref
                                .watch(createGameFormNotifierProvider)
                                .dateTime,
                            onChanged: createGameNotifier.setDateTime,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        onChanged: createGameNotifier.setLocation,
                        decoration: _decoration(
                          'Место*',
                          'Укажите, где будете играть',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        onChanged: createGameNotifier.setDescription,
                        maxLines: 10,
                        decoration: _decoration(
                          'Описание',
                          'Например: хотим поиграть 5х5, ищем команду',
                        ),
                      ),
                      const SizedBox(height: 16),

                      TextField(
                        onChanged: createGameNotifier.setName,
                        decoration: _decoration(
                          'Название игры*',
                          'Так вашим друзьям будет проще вас найти',
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: 40),
                      MainButton(
                        title: 'Создать игру',
                        isLoading: ref.watch(gameCreatorNotifierProvider) ==
                            const GameCreatorState.loading(),
                        onTap: () {
                          ref.read(createGameProvider);
                        },
                      ),
                      // SizedBox(
                      //   height: 60,
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: AppColors.main,
                      //     ),
                      //     onPressed: model.onCreateGameTapped,
                      //     child: const Text(
                      //       'Создать игру',
                      //       style: TextStyle(fontSize: 16),
                      //     ),
                      //   ),
                      // ),
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
