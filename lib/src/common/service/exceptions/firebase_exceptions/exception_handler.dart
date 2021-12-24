import 'package:digicoach/src/common/service/exceptions/firebase_exceptions/result_stats.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthExceptionHandler {
  static handleException(FirebaseAuthException e) {
    String status;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        status = generateExceptionMessage(AuthResultStatus.invalidEmail);
        break;
      case "ERROR_WRONG_PASSWORD":
        status = generateExceptionMessage(AuthResultStatus.wrongPassword);
        break;
      case "ERROR_USER_NOT_FOUND":
        status = generateExceptionMessage(AuthResultStatus.userNotFound);
        break;
      case "ERROR_USER_DISABLED":
        status = generateExceptionMessage(AuthResultStatus.userDisabled);
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = generateExceptionMessage(AuthResultStatus.tooManyRequests);
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = generateExceptionMessage(AuthResultStatus.operationNotAllowed);
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        status = generateExceptionMessage(AuthResultStatus.emailAlreadyExists);
        break;
      case "account-exists-with-different-credential":
        status = generateExceptionMessage(
            AuthResultStatus.accountExistsWithDifferentCredential);
        break;
      case "invalid-credential":
        status = generateExceptionMessage(AuthResultStatus.invalidCredential);
        break;
      case "invalid-verification-code":
        status =
            generateExceptionMessage(AuthResultStatus.invalidVerificationCode);
        break;
      case "invalid-verification-id":
        status =
            generateExceptionMessage(AuthResultStatus.invalidVerificationId);
        break;
      default:
        status = generateExceptionMessage(AuthResultStatus.undefined);
    }
    return status;
  }

  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.accountExistsWithDifferentCredential:
        errorMessage = "Account already exists.";
        break;
      case AuthResultStatus.invalidCredential:
        errorMessage = "The credential is not valid";
        break;
      case AuthResultStatus.invalidVerificationCode:
        errorMessage = "The verification code is invalid";
        break;
      case AuthResultStatus.invalidVerificationId:
        errorMessage = "The verification I'd is invalid";
        break;
      case AuthResultStatus.invalidEmail:
        errorMessage = "Your email address appears to be invalid.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Your password is wrong.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "User with this email doesn't exist.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            "The email has already been registered. Please login or reset your password.";
        break;
      case AuthResultStatus.emailNotVerified:
        errorMessage = '''Email not verified! please verify your email''';
        break;
      default:
        errorMessage = "Unknown error occurred";
    }

    return errorMessage;
  }
}
