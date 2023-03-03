class FirebaseAuthExceptionHandler {
  static String? generateMessage(String? firebaseExceptionMessage) {
    String errorMessage;
    switch (firebaseExceptionMessage) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Неверный формат e-mail.";
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "Неправильный пароль";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "Пользователь с таким e-mail не найден";
        break;

      case "ERROR_EMAIL_ALREADY_IN_USE":
        errorMessage =
            "E-mail Электронная почта уже зарегистрирован. Пожалуйста, войдите или сбросьте пароль.";
        break;
      case "ERROR_CREDENTIAL_ALREADY_IN_USE":
        errorMessage =
            "Эти учетные данные уже связаны с другой учетной записью пользователя.";
        break;
      case "ERROR_WEAK_PASSWORD":
        errorMessage =
            "Эти учетные данные уже связаны с другой учетной записью пользователя.";
        break;
      case "ERROR_MISSING_EMAIL":
        errorMessage = "Требуется адрес e-mail";
        break;
      case "The SMS verification code used to create the phone auth credential is invalid. Please resend the verification code SMS and be sure to use the verification code provided by the user.":
        errorMessage = 'Неверный код подтверждения';
        break;
      default:
        errorMessage = firebaseExceptionMessage ?? 'Неизвестная ошибка';
    }

    return errorMessage;
  }
}
