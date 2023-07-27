import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/presentation/teammates/components/teammates_list_view.dart';

class TeammatesPopUp extends ConsumerWidget {
  const TeammatesPopUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TeammatesListView();
  }
}
