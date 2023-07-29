import 'package:flutter/material.dart';
import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/feachers/game/domain/entities/city.dart';
import 'package:teammate/feachers/game/domain/repo/cities_storage.dart';

class CitiesDropdown extends StatelessWidget {
  const CitiesDropdown({
    required this.onCityChanged,
    required this.initialCity,
    super.key,
  });
  final void Function(City value) onCityChanged;
  final City? initialCity;

  List<DropdownMenuItem<City>> get _cities => CitiesStorage()
      .cities
      .map(
        (e) => DropdownMenuItem<City>(
          value: e,
          child: Text(e.name),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<City>(
      value: initialCity ?? _cities.first.value!,
      items: _cities,
      onChanged: (value) {
        if (value != null) onCityChanged(value);
      },
    );
  }
}
