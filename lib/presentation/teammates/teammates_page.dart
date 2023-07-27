import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/presentation/teammates/components/teammates_list_view.dart';

class MyTeammmatesPage extends ConsumerWidget {
  const MyTeammmatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.defaultPadding,
          child: Column(
            children: const [
              AppBarWidget(text: 'С кем вы играли'),
              Expanded(child: TeammatesListView()),
            ],
          ),
        ),
      ),
    );
  }
}
