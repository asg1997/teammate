import 'dart:developer';

class CustomExeption implements Exception {
  CustomExeption({
    this.message,
    this.causedError,
  }) {
    log('''
    CustomExeption:
    message: $message;
    causedError: $causedError;
''');
  }
  final String? message;
  final Object? causedError;
}
