import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';

import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/domain/repos/cities_storage.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/presentation/game/components/players_list_view.dart';
import 'package:teammate/presentation/game/game_page_model.dart';
import 'package:teammate/presentation/games/games_page.dart';
import 'package:teammate/service/date_extension.dart';

final gamePageRef =
    ChangeNotifierProvider.autoDispose.family<GamePageModel, Game>(
  (ref, game) => GamePageModel(
    game: game,
    gamesRepo: sl(),
    playersRepo: sl(),
  ),
);

class GamePage extends ConsumerWidget {
  const GamePage({
    required this.game,
    super.key,
  });
  final Game game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(gamePageRef(game));
    final cityName = CitiesStorage().fromPostcode(game.cityCode).name;
    return Scaffold(
      appBar: AppBarWidget(
        text: game.name,
        leading: game.isMy
            ?
            // КНОПКА РЕДАКТИВНОВАНИЯ
            IconButton(
                onPressed: () async {
                  await model.onDeleteTapped();
                  await ref.read(gamesPageProvider).removeGameFromView(game);
                },
                icon: const Icon(Icons.delete),
              )
            : null,
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.defaultPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // СПОРТ
                Text(
                  'Вид спорта',
                  style: AppFonts.medium14.copyWith(
                    color: AppColors.main,
                  ),
                ),
                const SizedBox(height: 5),

                Text(
                  game.sport.locale,
                  style: AppFonts.bodyLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Город
                Text(
                  'Город',
                  style: AppFonts.medium14.copyWith(
                    color: AppColors.main,
                  ),
                ),
                const SizedBox(height: 5),

                Text(
                  cityName,
                  style: AppFonts.bodyLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Место
                Text(
                  'Место',
                  style: AppFonts.medium14.copyWith(
                    color: AppColors.main,
                  ),
                ),
                const SizedBox(height: 5),

                Text(
                  game.location,
                  style: AppFonts.bodyLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // ВРЕМЯ
                Text(
                  'Дата и время',
                  style: AppFonts.medium14.copyWith(
                    color: AppColors.main,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  game.dateTime.toDayAndTimeString,
                  style: AppFonts.bodyLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                // КОЛИЧЕСТВО УЧАСТНИКОВ
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Участники (${model.players.length})',
                      style: AppFonts.medium18.copyWith(
                        color: AppColors.main,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                PlayersListView(
                  players: model.players,
                ),
                const SizedBox(height: 10),
                // ПОДЕЛИТЬСЯ / ПОЗВАТЬ ДРУЗЕЙ
                Align(
                  alignment: Alignment.centerRight,
                  child: _ShareButton(model.onInviteUsersTapped),
                ),

                const SizedBox(height: 30),
                // КНОПКА ПРИСОЕДИНИТЬСЯ / ВЫЙТИ
                if (!game.isMy) ...[
                  MainButton(
                    width: double.infinity,
                    title: model.isJoin ? 'Играть' : 'Отказаться',
                    onTap: model.onJoinTapped,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShareButton extends ConsumerWidget {
  const _ShareButton(this.onTap);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Позвать друзей',
              style: AppFonts.bodyMedium.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.share_rounded,
              color: AppColors.main,
            ),
          ],
        ),
      ),
    );
  }
}

// class PlayersListView extends ConsumerWidget {
//   const PlayersListView();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {


//         return SizedBox(
//           height: 200,
//           child: isLoading
//               ? const LoadingWidget()
//               : PlayersListView(
//                   players: state.players,
//                 ),
//         );
//   }
// }
