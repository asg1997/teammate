import 'package:flutter/material.dart';

import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/data/cities.dart';

class CitiesDropdown extends StatelessWidget {
  const CitiesDropdown({
    required this.onCityChanged,
    required this.initialCity,
    Key? key,
  }) : super(key: key);
  final Function(String value) onCityChanged;
  final String initialCity;

  List<DropdownMenuItem<String>> get _cities => cities
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      value: initialCity,
      items: _cities,
      onChanged: (value) {
        if (value != null) onCityChanged(value);
      },
    );
  }
}
