import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';

typedef Cities = List<City>;

@freezed
class City with _$City {
  const factory City({
    required String name,
    required int postcode,
  }) = _City;
}

City get defaultCity => const City(name: 'Москва', postcode: 101000);
