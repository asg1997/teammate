import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/presentation/game/game_page_model.dart';
import 'package:teammate/service/date_extension.dart';

final gamePageRef =
    ChangeNotifierProvider.family.autoDispose<GamePageModel, Game>(
  (ref, game) => GamePageModel(game: game),
);

class GamePage extends ConsumerWidget {
  const GamePage({super.key, required this.game});
  final Game game;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(gamePageRef(game));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          game.name,
          style: AppFonts.titleLarge,
        ),
        // КНОПКА РЕДКТИРОВАНИЯ ИГРЫ
        // actions: game.isMy
        //     ? [
        //         // КНОПКА РЕДАКТИВНОВАНИЯ
        //         IconButton(
        //           onPressed: model.onEditTapped,
        //           icon: const Icon(Icons.edit),
        //         )
        //       ]
        //     : null,
      ),
      backgroundColor: AppColors.secondaryBg,
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
                  game.city,
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Участники (${state.players.length})',
                //       style: AppFonts.titleMedium.copyWith(
                //         color: AppColors.main,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 10),
                // const _PlayersListView(),
                // const SizedBox(height: 10),
                // ПОДЕЛИТЬСЯ / ПОЗВАТЬ ДРУЗЕЙ
                Align(
                  alignment: Alignment.centerRight,
                  child: _ShareButton(() => model.onInviteUsersTapped()),
                ),

                const SizedBox(height: 30),
                // КНОПКА ПРИСОЕДИНИТЬСЯ / ВЫЙТИ
                // if (!game.isMy) ...[
                //   MainButton(
                //     width: double.infinity,
                //     title: model.joinTitle,
                //     onTap: model.onJoinToggle,
                //     isLoading:
                //         state.status == GameInfoStatus.isChangingJoinStatus,
                //   )
                // ]
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

// class _PlayersListView extends ConsumerWidget {
//   const _PlayersListView();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//      final isLoading = state.status == GameInfoStatus.isLoadingPLayers;

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
