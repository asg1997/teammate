import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:teammate/core/exception/custom_exception.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/domain/entities/city.dart';
import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/registration_repo.dart';

class RegistrationRepoImpl implements RegistrationRepo {
  final _db = FirebaseFirestore.instance;
  final _usersCollections = 'users';
  String get _id {
    final id = SessionDataService.sessionData?.id;
    if (id == null) throw Exception();
    return id;
  }

  @override
  Future<bool> get isRegistered async {
    final snapshot = await _db
        .collection(_usersCollections)
        .where('id', isEqualTo: _id)
        .get();
    final docs = snapshot.docs.firstOrNull;
    if (docs == null) return false;
    return true;
  }

  @override
  Future<void> register({
    required String nick,
    required City city,
  }) async {
    try {
      final user = User(nickname: nick, city: city, id: _id);
      await _db.collection(_usersCollections).add(user.toJson());
      await SessionDataService.saveSessionData(
        SessionDataService.sessionData!.copyWith(city: city),
      );
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<bool> isNickAvalible(String nick) async {
    final snapshot = await _db
        .collection(_usersCollections)
        .where('nickname', isEqualTo: nick)
        .get();

    final doc = snapshot.docs.firstOrNull;
    if (doc == null) return true;
    return false;
  }
}
