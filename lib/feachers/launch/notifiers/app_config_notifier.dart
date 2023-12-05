import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/data/nickname_storage.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/auth/data/user_id.dart';
import 'package:teammate/feachers/cities/data/cities_storage.dart';
import 'package:teammate/feachers/cities/presentation/notifiers/saved_city_notifier.dart';
import 'package:teammate/feachers/cities/presentation/providers/get_cities.dart';
import 'package:teammate/feachers/launch/notifiers/app_config_state.dart';

class AppConfigNotifier extends StateNotifier<AppConfigState> {
  AppConfigNotifier(this.ref) : super(const AppConfigState.loading());

  final Ref ref;

  Future<void> configureApp({String? withNickname}) async {
    await _getCitiesFromAssets();
    await _initCities();
    await _initSelectedCity();
    await _configureSessionData(withNickname);
  }

  Future<void> _configureSessionData(String? withNickname) async {
    if (withNickname != null) {
      return _initSessionData(withNickname);
    } else {
      await _getSavedNickname();
    }
  }

  Future<void> _initSessionData(String nickname) async {
    final userId = await ref.read(uniqueUserIdFetcher).currentUserId;
    SessionData.initialize(nickname: nickname, userId: userId);
    state = const AppConfigState.loggedIn();
  }

  Future<void> _getSavedNickname() async {
    try {
      final nickname = await ref.read(nicknameStorageProvider).getNickname();
      if (nickname != null) {
        return _initSessionData(nickname);
      } else {
        state = const AppConfigState.loggedOut();
        return;
      }
    } catch (e) {
      state = const AppConfigState.loggedOut();
    }
  }

  Future<void> _getCitiesFromAssets() async {
    final cities = await ref.watch(citiesStorageProvider).cities;
    ref.read(getCitiesProvider.notifier).state = cities;
  }

  Future<void> _initCities() async {
    final cities = await ref.read(citiesStorageProvider).cities;
    ref.read(getCitiesProvider.notifier).state = cities;
  }

  Future<void> _initSelectedCity() async =>
      ref.read(savedCityNotifierProvider.notifier).init();
}
