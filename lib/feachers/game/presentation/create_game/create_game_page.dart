import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/core/widgets/sport_dropdown.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/cities/presentation/cities_dropdown.dart';
import 'package:teammate/feachers/game/entities/sport.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/create_game/components/show_date_time_picker.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/create_game/models/game_creator_state.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/create_game/providers/create_game_form_notifier_provider.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/create_game/providers/game_creator_notifier_provider.dart';

class CreateGamePage extends ConsumerWidget {
  const CreateGamePage({super.key});

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
                      const _DateTimeWidget(),
                      const SizedBox(height: 16),
                      TextFieldWidget(
                        title: 'Место*',
                        hint: 'Укажите, где будете играть',
                        onChanged: createGameNotifier.setLocation,
                      ),
                      const SizedBox(height: 16),
                      TextFieldWidget(
                        onChanged: createGameNotifier.setDescription,
                        maxLines: 10,
                        title: 'Описание',
                        hint: 'Например: хотим поиграть 5х5, ищем команду',
                      ),
                      const SizedBox(height: 16),
                      TextFieldWidget(
                        onChanged: createGameNotifier.setName,
                        title: 'Название игры*',
                        hint:
                            'По названию вашим друзьям будет проще найти игру',
                      ),
                      const Spacer(),
                      const SizedBox(height: 40),
                      MainButton(
                        height: 56,
                        width: double.infinity,
                        title: 'Создать игру',
                        isLoading: ref.watch(gameCreatorNotifierProvider) ==
                            const GameCreatorState.loading(),
                        onTap: () {
                          final createGameModel =
                              ref.watch(createGameFormNotifierProvider);
                          ref
                              .read(gameCreatorNotifierProvider.notifier)
                              .createGame(createGameModel);
                        },
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

class _DateTimeWidget extends ConsumerWidget {
  const _DateTimeWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(createGameFormNotifierProvider).dateTime;
    final dateStr = date == null
        ? 'Укажите дату и время игры*'
        : DateFormat('EE dd MMMM, HH:mm', 'ru').format(date);
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Material(
        child: InkWell(
          onTap: () => showDateTimePicker(
            context,
            initial: date,
            onChanged: (date) {
              if (date == null) return;
              ref
                  .read(createGameFormNotifierProvider.notifier)
                  .setDateTime(date);
            },
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                dateStr,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(date == null ? 0.6 : 1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
