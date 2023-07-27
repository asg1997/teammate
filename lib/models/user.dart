class Player {
  Player({
    required this.nickname,
    required this.id,
    this.teammatesIds = const [],
  });
  final String nickname;
  final String id;
  final List<String> teammatesIds;
}
