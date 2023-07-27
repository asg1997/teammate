import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/presentation/teammates/teammates_page_model.dart';

final teammatesPageModel = ChangeNotifierProvider((ref) {
  return TeammatesPageModel(sl());
});

class MyTeammmatesPage extends ConsumerWidget {
  const MyTeammmatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.defaultPadding,
          child: Consumer(
            builder: (_, ref, __) {
              final model = ref.watch(teammatesPageModel);
              if (model.isLoading) return const Center(child: LoadingWidget());
              if (model.players.isEmpty) {
                return Center(
                  child: Text(
                    '''Здесь будут отображаться те, с кем вы играли''',
                    textAlign: TextAlign.center,
                    style: AppFonts.regular15.copyWith(color: Colors.white),
                  ),
                );
              }
              return Column(
                children: const [
                  AppBarWidget(text: 'С кем вы играли'),
                  Expanded(child: _TeammatesListView()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TeammatesListView extends ConsumerWidget {
  const _TeammatesListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(teammatesPageModel);
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: model.players.length,
      itemBuilder: (_, index) {
        final player = model.players[index];
        return SizedBox(
          height: 50,
          child: Text(
            player.nickname,
            style: AppFonts.regular18,
          ),
        );
      },
    );
  }
}
