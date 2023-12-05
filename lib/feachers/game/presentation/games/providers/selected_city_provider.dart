import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/cities/presentation/providers/saved_city_provider.dart';

final selectedCityProvider =
    StateProvider<City>((ref) => ref.read(savedCityProvider));
