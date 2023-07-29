import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/domain/repos/teammates_repo.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/player.dart';

class TeammatesRepoImpl implements TeammatesRepo {
  final _ref = FirebaseFirestore.instance.collection('teammates');

  // @override
  // Future<void> addTeammate(Player player) async {
  //   final myId = SessionData().userId;
  //   final playerJson = TeammatesMapper.toApi(player);
  //   await _ref.doc(myId).set(
  //     {
  //       'teammates': FieldValue.arrayRemove([playerJson])
  //     },
  //     SetOptions(merge: true),
  //   );
  // }

  @override
  Future<List<Player>> getMyTeammates() async {
    return [
      const Player(
        id: 'asd',
        nickname: 'Nick',
      ),
      const Player(
        id: '2',
        nickname: 'Mike',
      ),
      const Player(
        id: '3',
        nickname: 'Jane',
      ),
      const Player(
        id: '4',
        nickname: 'Valy',
      ),
    ];
    // final myId = SessionData().userId;
    // final snapshot = await _ref.doc(myId).get();
    // if (!snapshot.exists) return [];
    // final data = snapshot.data()!;
    // final teammatesJson = data['teammates'] as List<dynamic>?;
    // if (teammatesJson == null || teammatesJson.isEmpty) return [];
    // final teammates = teammatesJson
    //     .map((e) => TeammatesMapper.fromApi(e as Map<String, dynamic>))
    //     .toList();
    // return teammates;
  }

  @override
  Future<List<Player>> getTeammatesForGame(GameId gameId) {
    // TODO: implement getTeammatesForGame
    throw UnimplementedError();
  }
}
