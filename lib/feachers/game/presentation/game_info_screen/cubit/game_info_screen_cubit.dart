import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/game.dart';

part 'game_info_screen_state.dart';

class GameInfoScreenCubit extends Cubit<GameInfoScreenState> {
  GameInfoScreenCubit({required Game game})
      : _game = game,
        super(GameInfoScreenInitial());
  final Game _game;
  Game get game => _game;
  void esfsl() {}
}
