import 'package:magicview/App/shared/auth/validators/email_validator.dart';
import 'package:magicview/App/shared/auth/validators/password_validator.dart';

class Auth {
  register(String? email, String? password){
final emailError = EmailValidator(). Validate(email: email);
final passwordError = PasswordValidator().validate(password: password);

return emailError ?? passwordError;
  }
}