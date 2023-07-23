import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/cities_dropdown.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/presentation/games/components/games_list_view.dart';
import 'package:teammate/presentation/games/games_page_model.dart';

final gamesPageProvider = ChangeNotifierProvider.autoDispose(
  (ref) => GamesPageModel(cityRepo: sl(), gamesRepo: sl()),
);

class GamesPage extends ConsumerWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(gamesPageProvider);
    final games = model.games;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarWidget(
          text: '',
          leading: IconButton(
            onPressed: model.onNotificationsTap,
            icon: const Icon(
              Icons.notifications_on_outlined,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: AppColors.background,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFFF564B),
          onPressed: model.onCreateGame,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    CitiesDropdown(
                      initialCity: model.selectedCity,
                      onCityChanged: model.onCityChanged,
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
                                  ),
                                )
                              : GamesListView(
                                  games: games,
                                  onDeleted: model.removeGameFromView,
                                  onTap: model.onGameTap,
                                  onRefresh: model.loadGames,
                                  onScrollEnd: model.loadMore,
                                ),
                    ),
                  ],
                ),
                if (model.isLoadingMore)
                  const Positioned(
                    bottom: 20,
                    child: LoadingWidget(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
