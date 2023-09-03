import 'package:freezed_annotation/freezed_annotation.dart';
part 'field.freezed.dart';

@freezed
class Field with _$Field {
  const factory Field({
    required String value,
    @Default('') String errorMessage,
    @Default(false) bool isValid,
  }) = _Field;
  const Field._();

  factory Field.email({required String value}) {
    final isEmail = RegExp(
      r'^[a-z0-9]+([._a-z0-9-]+[a-z0-9])?@[a-z0-9]{2,}([.a-z0-9-]+[a-z0-9])?\.[a-z]{2,8}$',
    ).hasMatch(value);

    return Field(
      value: value,
      isValid: isEmail,
      errorMessage: isEmail ? '' : 'Некорректный формат e-mail',
    );
  }

  factory Field.phone({required String value}) {
    final onlyNums = value.replaceAll(RegExp(r'[\s()+-]'), '');
    final isValid = onlyNums.length == 11;
    return Field(
      value: onlyNums,
      isValid: isValid,
      errorMessage: isValid ? '' : 'Некорректный номер телефона',
    );
  }

  factory Field.password({required String value}) {
    final isValid = value.length >= 5;

    return Field(
      value: value,
      isValid: isValid,
      errorMessage: isValid ? '' : 'Пароль должен быть не менее 5 символов',
    );
  }

  factory Field.empty() => const Field(value: '');
}
