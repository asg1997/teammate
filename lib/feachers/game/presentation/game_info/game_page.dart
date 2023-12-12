import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/alerts/custom_dialog.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/custom_text_button.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/feachers/cities/presentation/providers/get_city_by_postcode_provider.dart';
import 'package:teammate/feachers/game/data/models/update_game_params.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';
import 'package:teammate/feachers/game/presentation/create_game/components/show_date_time_picker.dart';
import 'package:teammate/feachers/game/presentation/game_info/components/players_list_view.dart';
import 'package:teammate/feachers/game/presentation/game_info/components/share_game_button.dart';
import 'package:teammate/feachers/game/presentation/game_info/notifiers/delete_game_notifier.dart';
import 'package:teammate/feachers/game/presentation/game_info/notifiers/edit_game_notifier.dart';
import 'package:teammate/feachers/game/presentation/game_info/providers/change_join_state_provider.dart';
import 'package:teammate/feachers/game/presentation/game_info/providers/is_game_editing_provider.dart';
import 'package:teammate/feachers/game/presentation/game_info/providers/is_in_provider.dart';
import 'package:teammate/service/date_extension.dart';

final _formKey = GlobalKey<FormBuilderState>();
const _locationForm = 'location';
const _dateForm = 'date';

class GamePage extends ConsumerStatefulWidget {
  const GamePage({
    required this.game,
    super.key,
  });
  final Game game;

  static void navigate(BuildContext context, {required Game game}) =>
      navigatorKey.currentState?.push(
        MaterialPageRoute<void>(
          builder: (_) => GamePage(game: game),
        ),
      );

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  late final TextEditingController _placeController;
  late final TextEditingController _dateController;

  @override
  void initState() {
    _placeController = TextEditingController(text: widget.game.location)
      ..addListener(_locationListener);
    _dateController =
        TextEditingController(text: widget.game.dateTime.toDateAndTimeString);
    super.initState();
  }

  void _locationListener() => _formKey.currentState?.fields[_locationForm]
      ?.didChange(_placeController.text);
  void _dateListener() => _formKey.currentState?.fields[_dateForm]
      ?.didChange(_placeController.text);

  @override
  void dispose() {
    _placeController
      ..removeListener(_locationListener)
      ..dispose();
    _dateController
      ..removeListener(_dateListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..listen(deleteGameNotifierProvider, (_, state) {
        state.whenOrNull(
          success: (_) => navigatorKey.currentState?.pop(),
        );
      })
      ..listen(editGameNotifierProvider, (_, state) {
        state.whenOrNull(
          success: (_) => navigatorKey.currentState?.pop(),
        );
      });
    return Scaffold(
      appBar: AppBarWidget(
        text: widget.game.creatorId,
        leading: widget.game.isMy
            ?
            // КНОПКА РЕДАКТИРОВАНИЯ
            IconButton(
                icon: const Icon(Icons.edit_note),
                onPressed: () => ref
                    .read(isGameEditingProvider.notifier)
                    .update((state) => !state),
              )
            : null,
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: AppDecorations.defaultPadding,
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // СПОРТ
                  const _Title('Вид спорта'),
                  const SizedBox(height: 5),
                  _ValueText(widget.game.sport.locale),

                  const SizedBox(height: 20),

                  // ГОРОД
                  const _Title('Город'),
                  const SizedBox(height: 5),
                  _ValueText(
                    ref
                        .watch(getCityByPostcodeProvider(widget.game.cityCode))
                        .name,
                  ),
                  const SizedBox(height: 20),

                  // МЕСТО
                  FormBuilderField(
                    name: _locationForm,
                    builder: (_) => _LocationWidget(
                      game: widget.game,
                      controller: _placeController,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ВРЕМЯ
                  FormBuilderField(
                    name: _dateForm,
                    builder: (_) => _DateWidget(
                      game: widget.game,
                      controller: _dateController,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // ТАБЛИЦА С ИГРОКАМИ
                  Consumer(
                    builder: (context, ref, child) {
                      final isEditing = ref.watch(isGameEditingProvider);
                      // ИДЕТ РЕДАКТИРОВАНИЕ
                      if (isEditing) {
                        return Column(
                          children: [
                            // КНОПКА СОХРАНИТЬ
                            _SaveChangesButton(widget.game),
                            // КНОПКА УДАЛИТЬ
                            _DeleteGameButton(widget.game),
                          ],
                        );
                      }
                      // СТАНДАРТНЫЙ РЕЖИМ
                      return Column(
                        children: [
                          // СПИСОК ИГРОКОВ
                          PlayersListView(game: widget.game),
                          const SizedBox(height: 10),
                          // ПОДЕЛИТЬСЯ / ПОЗВАТЬ ДРУЗЕЙ
                          Align(
                            alignment: Alignment.centerRight,
                            child: ShareGameButton(widget.game),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                  // КНОПКА ПРИСОЕДИНИТЬСЯ / ВЫЙТИ
                  if (widget.game.isNotMy) ...[
                    MainButton(
                      width: double.infinity,
                      title: ref.watch(isInProvider(widget.game))
                          ? 'Отказаться'
                          : 'Играть',
                      onTap: () => ref.read(toggleIsInProvider(widget.game)),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveChangesButton extends ConsumerWidget {
  const _SaveChangesButton(this.game);
  final Game game;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainButton(
      width: double.infinity,
      title: 'Сохранить',
      onTap: () {
        final location =
            _formKey.currentState!.fields[_locationForm]?.value as String?;
        final date =
            _formKey.currentState?.fields[_dateForm]?.value as DateTime?;

        ref.read(editGameNotifierProvider.notifier).editGame(
              game: game,
              params: UpdateGameParams(
                dateTime: date,
                location: location,
              ),
            );
      },
    );
  }
}

class _DeleteGameButton extends ConsumerWidget {
  const _DeleteGameButton(this.game);
  final Game game;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextButton(
      title: 'Удалить',
      onTap: () => showCustomDialog(
        context,
        title: 'Вы точно хотите удалить игру?',
        description: 'Данное действия нельзя будет отменить',
        okButtonText: 'Удалить',
        onOkTapped: () =>
            ref.read(deleteGameNotifierProvider.notifier).deleteGame(game),
      ),
    );
  }
}

class _DateWidget extends ConsumerWidget {
  const _DateWidget({required this.controller, required this.game});
  final Game game;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isGameEditingProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Title('Дата и время'),
        const SizedBox(height: 5),
        if (isEditing) ...[
          TextFieldWidget(
            readOnly: true,
            title: 'Дата и время',
            onTap: () => showDateTimePicker(
              context,
              initial: game.dateTime,
              onChanged: (date) {
                if (date == null) return;
                _formKey.currentState?.fields[_dateForm]?.didChange(date);
                controller.text = date.toDateAndTimeString;
              },
            ),
            controller: controller,
          ),
        ] else ...[
          _ValueText(game.location),
        ],
      ],
    );
  }
}

class _LocationWidget extends ConsumerWidget {
  const _LocationWidget({required this.game, required this.controller});
  final Game game;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isGameEditingProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Title('Место'),
        const SizedBox(height: 5),
        if (isEditing) ...[
          TextFieldWidget(
            title: 'Место',
            controller: controller,
          ),
        ] else ...[
          _ValueText(game.dateTime.toDayAndTimeString),
        ],
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);
  final String title;
  @override
  Widget build(BuildContext context) => Text(
        title,
        style: AppFonts.medium14.copyWith(
          color: AppColors.main,
        ),
      );
}

class _ValueText extends StatelessWidget {
  const _ValueText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: AppFonts.bodyLarge.copyWith(
          color: Colors.white,
        ),
      );
}
