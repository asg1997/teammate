import 'package:flutter/material.dart';

import 'package:teammate/core/widgets/custom_dropdown.dart';
import 'package:teammate/feachers/game/entities/sport.dart';

class SportDropdown extends StatelessWidget {
  const SportDropdown({
    required this.onSportChanged,
    required this.initialSport,
    super.key,
  });
  final void Function(Sport value) onSportChanged;
  final Sport? initialSport;

  @override
  Widget build(BuildContext context) {
    final sportItems = Sport.values
        .map(
          (e) => DropdownMenuItem<Sport>(
            value: e,
            child: Text(e.locale),
          ),
        )
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
