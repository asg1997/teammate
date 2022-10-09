import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_game_state.dart';

class CreateGameCubit extends Cubit<CreateGameState> {
  CreateGameCubit() : super(CreateGameInitial());
}
