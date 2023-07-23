import 'package:flutter/material.dart';

import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/domain/repos/cities_storage.dart';
import 'package:teammate/models/city.dart';

class CitiesDropdown extends StatelessWidget {
  const CitiesDropdown({
    required this.onCityChanged,
    required this.initialCity,
    Key? key,
  }) : super(key: key);
  final Function(City value) onCityChanged;
  final City? initialCity;

  List<DropdownMenuItem<City>> get _cities => CitiesStorage()
      .cities
      .map((e) => DropdownMenuItem<City>(
            value: e,
            child: Text(e.name),
          ))
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