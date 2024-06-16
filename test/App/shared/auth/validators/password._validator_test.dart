import 'package:flutter_test/flutter_test.dart';
import 'package:magicview/App/shared/auth/validators/password_validator.dart';


void main() {
  late PasswordValidator passwordValidator;

  setUp((){
    passwordValidator = PasswordValidator();
  });
  
  
  group('password validation', () { 

    test('return message if password is null', () {
      final result = passwordValidator.validate(password: '');
      
      expect(result, equals('password is mandatory'));
     
    }
    );
      test('return message if password is empty', () {
      final result = passwordValidator.validate( );
      
      expect(result, equals('password is mandatory'));
     
    }
    );
    test('return error message if password is less than 6 characters', () {
      final result = passwordValidator.validate(password: 'dani');
      
      expect(result, equals('return error message if password is less than 6 characters'),);
     
    }
    );
    test('return error message if password is not alphanumeric', () {
      final result = passwordValidator.validate(password: 'daniela');
      
      expect(result, equals('the password must be alphanumeric'),);
     
    }
    );
    test('return null if the password is valid', () {
      final result = passwordValidator.validate(password: 'daniela297');
      
      expect(result, isNull);
     
    }
    );
  }
  );
}