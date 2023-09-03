import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/data/cities_storage.dart';
import 'package:teammate/feachers/cities/entities/city.dart';

final getCitiesProvider =
    FutureProvider<Cities>((ref) => ref.watch(citiesStorageProvider).cities);
