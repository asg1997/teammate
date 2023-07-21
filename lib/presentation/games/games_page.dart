import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/data/cities.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/presentation/games/components/games_list_view.dart';
import 'package:teammate/presentation/games/games_page_model.dart';

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
          backgroundColor: AppColors.background,
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
                                        : GamesListView(
                                            games: games,
                                            onDeleted: model.onDeleteTapped,
                                            onTap: model.onGameTap,
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
