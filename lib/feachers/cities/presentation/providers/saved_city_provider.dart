import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/cities/presentation/notifiers/saved_city_notifier.dart';

final savedCityProvider = StateProvider.autoDispose<City>(
  (ref) => ref.read(savedCityNotifierProvider) ?? defaultCity,
);
