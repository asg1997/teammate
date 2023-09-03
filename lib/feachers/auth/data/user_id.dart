import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uniqueUserIdFetcher =
    Provider<UniqueUserIdFetcher>((ref) => UniqueUserIdFetcherImpl());

abstract class UniqueUserIdFetcher {
  Future<String> get currentUserId;
}

class UniqueUserIdFetcherImpl implements UniqueUserIdFetcher {
  final _deviceInfo = DeviceInfoPlugin();
  @override
  Future<String> get currentUserId async {
    if (Platform.isIOS) {
      return _getForIos();
    } else if (Platform.isAndroid) {
      return _getForAndroid();
    }
    throw UnimplementedError(
      'unable to get current user id: device type is unknown',
    );
  }

  Future<String> _getForIos() async {
    final iosDeviceInfo = await _deviceInfo.iosInfo;
    final id = iosDeviceInfo.identifierForVendor;
    if (id == null) {
      throw UnimplementedError('unable to get current user id for IOS');
    }
    return id;
  }

  Future<String> _getForAndroid() async {
    final androidDeviceInfo = await _deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  }
}
