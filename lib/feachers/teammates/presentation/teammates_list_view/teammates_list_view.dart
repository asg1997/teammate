import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/feachers/auth/domain/entities/player.dart';
import 'package:teammate/feachers/teammates/presentation/teammates_list_view/providers/get_my_teammates_provider.dart';
import 'package:teammate/feachers/teammates/presentation/teammates_list_view/providers/is_teammate_selected_provider.dart';
import 'package:teammate/feachers/teammates/presentation/teammates_list_view/providers/selected_teammates_provider.dart';

class TeammatesListView extends ConsumerWidget {
  const TeammatesListView({
    this.selectedPlayers,
    this.selectionMode = false,
    this.shrinkWrap = false,
    super.key,
  });

  final void Function(List<Player> players)? selectedPlayers;
  final bool selectionMode;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teammates = ref.watch(getMyTeammatesProvider);
    ref.listen(selectedTeammatesProvider, (previous, current) {
      if (previous != current) selectedPlayers?.call(current);
    });

    return teammates.when(
      data: (players) => players.isEmpty
          ? const _TeammatesEmptyInfoWidget()
          : ListView.builder(
              shrinkWrap: shrinkWrap,
              padding: EdgeInsets.zero,
              itemCount: players.length,
              itemBuilder: (_, index) {
                final player = players[index];
                return _TeammatesListViewItem(
                  player: player,
                  onSelectionChanged: (_) => ref
                      .read(selectedTeammatesProvider.notifier)
                      .toggle(player),
                  isSelected: selectionMode
                      ? ref.watch(isTeammateSeletedProvider(player))
                      : null,
                );
              },
            ),
      error: (_, __) => Container(),
      loading: LoadingWidget.new,
    );
  }
}

class _TeammatesListViewItem extends StatelessWidget {
  const _TeammatesListViewItem({
    required this.player,
    this.onSelectionChanged,
    this.isSelected,
  });
  final Player player;
  final bool? isSelected;
  final void Function(bool value)? onSelectionChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isSelected != null) onSelectionChanged?.call(!isSelected!);
      },
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              player.nickname,
              style: AppFonts.regular18,
            ),
            if (isSelected != null)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.main),
                ),
                child: isSelected == null
                    ? null
                    : isSelected!
                        ? Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: AppColors.main,
                              shape: BoxShape.circle,
                            ),
                          )
                        : Container(),
              )
          ],
        ),
      ),
    );
  }
}

class _TeammatesEmptyInfoWidget extends ConsumerWidget {
  const _TeammatesEmptyInfoWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        'Здесь будут отображаться те, с кем вы играли',
        textAlign: TextAlign.center,
        style: AppFonts.regular15.copyWith(color: Colors.white),
      ),
    );
  }
}
