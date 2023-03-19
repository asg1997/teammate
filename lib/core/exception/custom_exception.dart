import 'package:flutter/foundation.dart';

class CustomException implements Exception {
  CustomException({
    this.message,
    this.causedError,
  }) {
    if (causedError != null && kDebugMode) {
      debugPrint(causedError.toString());
    }
  }
  final String? message;
  final Object? causedError;
}
