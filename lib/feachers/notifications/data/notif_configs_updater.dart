import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';
import 'package:teammate/feachers/notifications/data/mappers/notification_settings_api_mapper.dart';
import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';
import 'package:teammate/service/notifications_service.dart';

final notifConfigsUpdaterProvider = Provider<NotifConfigsUpdater>(
  (ref) => NotifConfigsUpdaterImpl(),
);

abstract class NotifConfigsUpdater {
  Future<void> updateSettings(NotifConfigs settings);
}

class NotifConfigsUpdaterImpl implements NotifConfigsUpdater {
  final _db = FirebaseFirestore.instance;
  late final _ref = _db.collection(FirebaseCollections.players);

  @override
  Future<void> updateSettings(NotifConfigs settings) async {
    try {
      final token = await _getPushToken();

      final json = NotifConfigsApiMapper.toApi(settings);
      await _ref.doc(token).set(
          {FirebaseFields.notificationSettings: json}, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw CustomException.fromServer(e);
    } catch (e) {
      throw CustomException.autoGeneratedMsg(e);
    }
  }

  Future<String> _getPushToken() => NotificationsService().getDeviceToken();
}
