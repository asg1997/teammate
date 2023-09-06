import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/entities/city.dart';

final selectedCityProvider = StateProvider<City>((ref) => defaultCity);
