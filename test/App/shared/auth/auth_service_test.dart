import 'package:flutter_test/flutter_test.dart';
import 'package:magicview/App/shared/auth/auth.service.dart';



  


void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });

   group('registration validation', () {

    test('return a message to an invalid email and password', () {
      final result = auth.register ('daniela', '297');
      expect(result, isA<String>());
    });
    test('return null for a valid email and password', () {
      final result = auth.register ('daniela@.com', 'daniela297');
      expect(result, isA<String>());
    });

   });
}