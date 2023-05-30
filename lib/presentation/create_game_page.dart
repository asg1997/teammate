import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teammate/app_decorations.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/presentation/components/loading_widget.dart';
import 'package:teammate/data/cities.dart';
import 'package:teammate/data/games_repo.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/sport.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateGamePage extends StatefulWidget {
  const CreateGamePage({Key? key}) : super(key: key);

  @override
  _CreateGamePageState createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
  bool _isLoading = false;
  final _gamesRepo = GamesRepo();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  static const name = 'name';
  static const city = 'city';
  static const sport = 'sport';
  static const phone = 'phone';
  static const description = 'description';
  static const dateTime = 'dateTime';
  static const location = 'location';

  late final List<DropdownMenuItem<Sport>> _sportItems = Sport.values
      .map((e) => DropdownMenuItem<Sport>(
            value: e,
            child: Text(e.locale),
          ))
      .toList();

  late final List<DropdownMenuItem<String>> _cities = cities
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();

  Future<void> _onCreateGameTapped() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      Fluttertoast.showToast(msg: 'Заполните все поля *');
      return;
    }
    _isLoading = true;
    setState(() {});
    try {
      final game = await _getGameFromForm();
      await _createGame(game);
      navigatorKey.currentState?.pop(game);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Не удается создать игру, попробуйте позже');
    } finally {
      _isLoading = false;
      setState(() {});
    }
  }

  Future<Game> _getGameFromForm() async {
    final userId = SessionData().userId;

    var game = Game(
      name: _formKey.currentState!.fields[name]!.value,
      city: _formKey.currentState!.fields[city]!.value,
      sport: _formKey.currentState!.fields[sport]!.value,
      phone: _formKey.currentState!.fields[phone]!.value,
      description: _formKey.currentState?.fields[description]?.value,
      creatorId: userId,
      dateTime: _formKey.currentState!.fields[dateTime]!.value,
      location: _formKey.currentState!.fields[location]!.value,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    return game;
  }

  Future<void> _createGame(Game game) async {
    _gamesRepo.createGame(game);
  }

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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppDecorations.background,
        appBar: AppBar(
          backgroundColor: AppDecorations.background,
          centerTitle: true,
          title: const Text('Создать игру'),
        ),
        body: _isLoading
            ? const LoadingWidget()
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              FormBuilderDropdown(
                                name: city,
                                items: _cities,
                                validator: FormBuilderValidators.required(),
                                decoration: _decoration(
                                  'Город*',
                                  'Укажите город, в котором будет игра',
                                ),
                              ),
                              const SizedBox(height: 16),
                              FormBuilderDropdown(
                                name: sport,
                                items: _sportItems,
                                validator: FormBuilderValidators.required(),
                                decoration: _decoration(
                                  'Спорт*',
                                  'Выберите спорт',
                                ),
                              ),
                              const SizedBox(height: 16),
                              FormBuilderDateTimePicker(
                                firstDate: DateTime.now(),
                                name: dateTime,
                                format: DateFormat('dd MMMM yyyy, HH:mm', 'ru'),
                                validator: FormBuilderValidators.required(),
                                decoration: _decoration(
                                  'Дата и время*',
                                  'Укажите дату игры',
                                ),
                              ),
                              const SizedBox(height: 16),
                              FormBuilderTextField(
                                name: location,
                                validator: FormBuilderValidators.required(),
                                decoration: _decoration(
                                  'Место*',
                                  'Укажите, где будете играть',
                                ),
                              ),
                              const SizedBox(height: 16),
                              FormBuilderTextField(
                                name: description,
                                maxLines: 10,
                                decoration: _decoration(
                                  'Описание',
                                  'Например: хотим поиграть 5х5, ищем команду',
                                ),
                              ),
                              const SizedBox(height: 16),
                              FormBuilderTextField(
                                name: name,
                                validator: FormBuilderValidators.required(),
                                decoration: _decoration(
                                  'Имя*',
                                  'Как вас зовут',
                                ),
                              ),
                              const SizedBox(height: 16),
                              FormBuilderTextField(
                                name: phone,
                                validator: FormBuilderValidators.required(),
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
                                      backgroundColor:
                                          AppDecorations.mainColor),
                                  onPressed: _onCreateGameTapped,
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
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
