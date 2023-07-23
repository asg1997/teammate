import 'package:flutter/material.dart';

import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/models/sport.dart';

class SportDropdown extends StatelessWidget {
  const SportDropdown({
    required this.onSportChanged,
    required this.initialSport,
    Key? key,
  }) : super(key: key);
  final Function(Sport value) onSportChanged;
  final Sport? initialSport;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<Sport>> sportItems = Sport.values
        .map((e) => DropdownMenuItem<Sport>(
              value: e,
              child: Text(e.locale),
            ))
        .toList();
    return CustomDropdown<Sport>(
      hint: const Text('Спорт'),
      value: initialSport ?? sportItems.first.value!,
      items: sportItems,
      onChanged: (value) {
        if (value != null) onSportChanged(value);
      },
    );
  }
}
