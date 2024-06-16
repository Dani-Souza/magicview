import 'package:flutter_test/flutter_test.dart';
import 'package:magicview/App/shared/auth/validators/email_validator.dart';


 void main() {
late EmailValidator emailvalidator;

setUp((){
  emailvalidator = EmailValidator();
});
  group('email validition', () { 
    test('return a message if the email is null', () {
      final Result = emailvalidator.Validate();

      expect(Result, equals('Email is mandatory'));
    });
test('return a message if the email is empty', () {
      final Result = emailvalidator.Validate(email: '');

      expect(Result, equals('Email is mandatory'));

  });
  test('return a message if the email is invalid', () {
      final Result = emailvalidator.Validate(email: 'daniela');

      expect(Result, equals('Email is invalid'));
},);
test('return message if email is valid', () {
      final Result = emailvalidator.Validate(email: 'daniela@gmail.com');

      expect(Result, isNull);
},);
},);}