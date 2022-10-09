import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/feachers/game/presentation/game_info_screen/cubit/game_info_screen_cubit.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../../core/consts/app_decorations_prop.dart';
import '../../../../core/consts/app_fonts.dart';

class GameInfoScreen extends StatelessWidget {
  const GameInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<GameInfoScreenCubit>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          model.game.name,
          style: AppFonts.titleLarge,
        ),
      ),
      backgroundColor: AppColors.secondaryBg,
      body: SafeArea(
        child: Padding(
          padding: AppDecProp.defaultPadding,
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
