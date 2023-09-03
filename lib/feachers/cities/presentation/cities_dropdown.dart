import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/feachers/cities/data/city_repo.dart';

import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/cities/providers/get_cities.dart';

class CitiesDropdown extends ConsumerWidget {
  const CitiesDropdown({
    required this.onCityChanged,
    this.saveCityWhenChange = true,
    super.key,
  });
  final void Function(City value) onCityChanged;

  /// сохраняем новый город локально
  /// каждый раз, когда меняется значение в дропдауне
  final bool saveCityWhenChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final citiesResult = ref.watch(getCitiesProvider);
    return citiesResult.maybeWhen(
      data: (cities) => CustomDropdown<City>(
        value: cities.first,
        items: cities
            .map((e) => DropdownMenuItem<City>(child: Text(e.name)))
            .toList(),
        onChanged: (value) async {
          if (value == null) return;
          onCityChanged(value);
          if (saveCityWhenChange) {
            await ref.read(cityRepoProvider).saveCity(value);
          }
        },
      ),
      orElse: Container.new,
    );
  }
}
