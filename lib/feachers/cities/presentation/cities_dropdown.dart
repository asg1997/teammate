import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/cities/presentation/providers/get_cities.dart';
import 'package:teammate/feachers/cities/presentation/providers/saved_city_provider.dart';

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
    // ignore: inference_failure_on_function_invocation
    final cities = ref.watch(getCitiesProvider);
    final initialValue = ref.read(savedCityProvider);
    return CustomDropdown<City>(
      initialValue: initialValue,
      items: cities
          .map(
            (e) => DropdownMenuItem<City>(
              value: e,
              child: Text(e.name),
            ),
          )
          .toList(),
      onChanged: (value) async {
        if (value == null) return;
        onCityChanged(value);
      },
    );
  }
}
