import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/core/app_decorations.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/data/cities.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/presentation/games/games_page_model.dart';
import 'package:teammate/service/date_extension.dart';

final gamesPageProvider = ChangeNotifierProvider.autoDispose(
    (ref) => GamesPageModel(cityRepo: sl(), gamesRepo: sl()));

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
          backgroundColor: AppDecorations.background,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFFF564B),
            onPressed: model.onCreateGame,
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 40),
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
                                : RefreshIndicator(
                                    onRefresh: model.loadGames,
                                    child: model.games.isEmpty
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
                                            itemBuilder: (_, index) =>
                                                _GameTile(
                                                    game: games[index],
                                                    onDeleted: () =>
                                                        model.removeGame(
                                                            games[index])),
                                            separatorBuilder: (_, index) =>
                                                const SizedBox(height: 10),
                                          ),
                                  ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}

class _GameTile extends ConsumerWidget {
  const _GameTile({required this.game, required this.onDeleted});
  final Game game;
  final VoidCallback onDeleted;

  void _showMenu(
    BuildContext context,
    WidgetRef ref,
    LongPressDownDetails details,
  ) {
    final offset = details.globalPosition;
    if (!_isMy) return;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      items: [
        PopupMenuItem(
          onTap: () => _onDeleteTapped(ref),
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

  bool get _isMy => SessionData().userId == game.creatorId;
  String get _name {
    return _isMy ? '${game.name} (вы)' : game.name;
  }

  void _onDeleteTapped(WidgetRef ref) =>
      ref.read(gamesPageProvider).onDeleteTapped(game);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = game.dateTime.toDayAndTimeString;

    return GestureDetector(
      onLongPressDown: (details) => _showMenu(context, ref, details),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                  game.sport.locale,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // ОПИСАНИЕ
            const SizedBox(height: 20),
            if (game.description != null && game.description!.isNotEmpty) ...[
              Text(game.description!),
              const SizedBox(height: 10),
            ],
            // Место
            Text(game.location),
            const SizedBox(height: 10),

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
                game.phone,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
