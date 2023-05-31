import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:teammate/app_decorations.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/presentation/components/drawer_content.dart';
import 'package:teammate/presentation/components/loading_widget.dart';
import 'package:teammate/data/cities.dart';
import 'package:teammate/data/city_repo.dart';
import 'package:teammate/data/games_repo.dart';

import 'package:teammate/main.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/presentation/create_game_page.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  List<Game> games = [];
  var isLoading = false;
  String _selectedCity = 'Москва';

  final _gamesRepo = GamesRepo();
  final _cityRepo = CityRepo();

  Future<void> _loadGames() async {
    isLoading = true;
    setState(() {});
    games = await _gamesRepo.getGames(_selectedCity);
    isLoading = false;
    setState(() {});
  }

  Future<void> _getSavedCity() async {
    final saved = await _cityRepo.getSavedCity();
    if (saved != null) setState(() => _selectedCity = saved);
  }

  Future<void> _init() async {
    isLoading = true;
    setState(() {});
    await _getSavedCity();
    await _loadGames();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void onCreateGame() async {
    final game = await navigatorKey.currentState
            ?.push(MaterialPageRoute(builder: (_) => const CreateGamePage()))
        as Game?;
    if (game != null) _addGame(game);
  }

  void _addGame(Game game) {
    if (game.city == _selectedCity) {
      games.add(game);
      setState(() {});
    }
  }

  InputDecoration _decoration(String label, String hint) {
    return InputDecoration(
      focusedBorder: const OutlineInputBorder(),
      border: const OutlineInputBorder(),
      labelText: label,
      hintText: hint,
      fillColor: Colors.white,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }

  List<DropdownMenuItem<String>> get _cities => cities
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();

  Future<void> onCityChanged(String city) async {
    _selectedCity = city;
    setState(() {});
    _cityRepo.saveCity(city);
    await _loadGames();
  }

  void _removeGame(Game game) {
    games.remove(game);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          drawer: const Drawer(
            child: DrawerContent(),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: AppDecorations.background,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFFF564B),
            onPressed: onCreateGame,
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RefreshIndicator(
                onRefresh: () async {
                  _loadGames();
                },
                child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        child: Column(
                          children: [
                            FormBuilderDropdown(
                              initialValue: _selectedCity,
                              onChanged: (value) {
                                if (value != null) onCityChanged(value);
                              },
                              name: 'city',
                              items: _cities,
                              validator: FormBuilderValidators.required(),
                              decoration: _decoration(
                                'Город*',
                                'Укажите город, в котором будет игра',
                              ),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: isLoading
                                  ? const LoadingWidget()
                                  : games.isEmpty
                                      ? const Center(
                                          child: Text(
                                          'В вашем городе пока нет игр',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ))
                                      : ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: games.length,
                                          itemBuilder: (_, index) => _GameTile(
                                              game: games[index],
                                              onDeleted: () =>
                                                  _removeGame(games[index])),
                                          separatorBuilder: (_, index) =>
                                              const SizedBox(height: 10),
                                        ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          )),
    );
  }
}

class _GameTile extends StatefulWidget {
  const _GameTile({required this.game, required this.onDeleted});
  final Game game;
  final VoidCallback onDeleted;

  @override
  State<_GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<_GameTile> {
  final _gamesRepo = GamesRepo();

  bool get _isMy => SessionData().userId == widget.game.creatorId;
  String get _name => _isMy ? '${widget.game.name} (вы)' : widget.game.name;

  TapDownDetails? _tapDownDetails;

  void _onTapDown(TapDownDetails details) => _tapDownDetails = details;

  void _showMenu(BuildContext context) {
    if (!_isMy) return;
    final offset = _tapDownDetails!.globalPosition;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      items: [
        PopupMenuItem(
          onTap: _onDeleteTapped,
          child: const Text(
            'Удалить игру',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void _onDeleteTapped() {
    _gamesRepo.delete(widget.game);
    widget.onDeleted();
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('dd MMM HH:mm', 'ru').format(widget.game.dateTime);

    return Material(
      color: Colors.white,
      child: InkWell(
        onTapDown: _onTapDown,
        onLongPress: () => _showMenu(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ДАТА
                  Expanded(
                    child: Text(
                      date,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  // СПОРТ
                  Text(
                    widget.game.sport.locale,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // ОПИСАНИЕ
              const SizedBox(height: 20),
              if (widget.game.description != null &&
                  widget.game.description!.isNotEmpty) ...[
                Text(widget.game.description!),
                const SizedBox(height: 10),
              ],
              // ИМЯ
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              // ТЕЛЕФОН
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.game.phone,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
