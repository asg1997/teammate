import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef Entered = bool;

class JoinNotifier extends StateNotifier<Entered> {
  JoinNotifier(super.state);

  void toggle() {}
}
