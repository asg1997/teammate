import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:teammate/service/notifications_service.dart';
import 'package:translit/translit.dart';

class NotificationsRepo {
  final _db = FirebaseFirestore.instance;
  late final _ref = _db.collection('city_subscribers');

  Future<void> subscribeUserToCity(String city) async {
    final topic = _cityToTopicName(city);
    final pushToken = await _getPushToken();
    await _ref.doc(topic).set(
      {
        'subscribers': FieldValue.arrayUnion([pushToken])
      },
      SetOptions(merge: true),
    );
  }

  Future<void> unsubscribeUserFromCity(String city) async {
    final topic = _cityToTopicName(city);
    final pushToken = await _getPushToken();
    await _ref.doc(topic).set(
      {
        'subscribers': FieldValue.arrayRemove([pushToken])
      },
      SetOptions(merge: true),
    );
  }

  Future<String> _getPushToken() => NotificationsService().getDeviceToken();

  String _cityToTopicName(String city) {
    return Translit().toTranslit(source: city).toLowerCase();
  }
}
