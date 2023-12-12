import 'package:flutter_riverpod/flutter_riverpod.dart';

final isGameEditingProvider = StateProvider.autoDispose<bool>((ref) => false);
