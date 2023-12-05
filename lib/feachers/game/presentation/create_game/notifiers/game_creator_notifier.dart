import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/data/repo/games_repo.dart';
import 'package:teammate/feachers/game/entities/create_game_params.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/create_game/models/create_game_model.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/create_game/models/game_creator_state.dart';

class GameCreatorNotifier extends StateNotifier<GameCreatorState> {
  GameCreatorNotifier({required this.gamesRepo})
      : super(const GameCreatorState.initial());
  final GamesRepo gamesRepo;

  Future<void> createGame(CreateGameModel model) async {
    state = const GameCreatorState.initial();
    final fieldsValid = _fieldsValid(model);
    if (!fieldsValid) return;

    final params = CreateGameParams(
      location: model.location.value,
      sport: model.sport,
      description: model.description.value,
      dateTime: model.dateTime!,
      city: model.city,
      name: model.name.value,
    );
    const GameCreatorState.loading();
    try {
      final game = await gamesRepo.createGame(params);
      state = GameCreatorState.success(game);
    } catch (e) {
      state = GameCreatorState.error(e.toString());
    }
  }

  bool _fieldsValid(CreateGameModel model) {
    if (!model.filled) {
      state = const GameCreatorState.error('Заполните все поля *');
    }
    return model.filled;
  }
}
