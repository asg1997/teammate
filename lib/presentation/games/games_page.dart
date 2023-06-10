import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:teammate/app_decorations.dart';
import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/data/cities.dart';
import 'package:teammate/data/games_repo.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/presentation/games/games_page_model.dart';

final gamesPageProvider =
    ChangeNotifierProvider.autoDispose((ref) => GamesPageModel());

class GamesPage extends ConsumerWidget {
  const GamesPage({super.key});

  List<DropdownMenuItem<String>> get _cities => cities
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(gamesPageProvider);
    final games = model.games;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          // drawer: const Drawer(
          //   child: DrawerContent(),
          // ),
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          // ),
          backgroundColor: AppDecorations.background,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFFF564B),
            onPressed: model.onCreateGame,
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RefreshIndicator(
                onRefresh: model.loadGames,
                child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        child: Column(
                          children: [
                            CustomDropdown<String>(
                              value: model.selectedCity,
                              items: _cities,
                              onChanged: (value) {
                                if (value != null) model.onCityChanged(value);
                              },
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: model.isLoading
                                  ? const LoadingWidget()
                                  : model.games.isEmpty
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
                                              onDeleted: () => model
                                                  .removeGame(games[index])),
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
