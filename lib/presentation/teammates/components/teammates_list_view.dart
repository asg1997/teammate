import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/domain/repos/teammates_repo.dart';

final teammatesRepoProvider = Provider<TeammatesRepo>((ref) => sl());

final teammatesListViewProvider = FutureProvider((ref) {
  final teammatesRepo = ref.watch(teammatesRepoProvider);
  return teammatesRepo.getMyTeammates();
});

class TeammatesListView extends ConsumerWidget {
  const TeammatesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(teammatesListViewProvider);
    return model.when(
      data: (players) => players.isEmpty
          ? const _TeammatesEmptyInfoWidget()
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: players.length,
              itemBuilder: (_, index) {
                final player = players[index];
                return SizedBox(
                  height: 50,
                  child: Text(
                    player.nickname,
                    style: AppFonts.regular18,
                  ),
                );
              },
            ),
      error: (_, __) => Container(),
      loading: LoadingWidget.new,
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
