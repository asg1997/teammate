import 'package:equatable/equatable.dart';

typedef PlayerId = String;

class Player extends Equatable {
  const Player({
    required this.nickname,
    required this.id,
    this.teammatesIds = const [],
  });
  final String nickname;
  final PlayerId id;
  final List<String> teammatesIds;

  @override
  List<Object?> get props => [nickname, id, teammatesIds];
}
