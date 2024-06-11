import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magicview/adapter/sharePreferencesAdapter.dart';
import 'package:magicview/pages/home_pages/components/my_text_form_field.dart';
import 'package:magicview/pages/login_page/login_page.dart';
import 'package:magicview/reposistories/remote/favorite_repositoy_impl.dart';
import 'package:mockito/mockito.dart';

class FavoriteRespositoryMock extends Mock implements FavoriteRespositoryImpl {
  loginSut(
          String url,
          String endPoint,
          Map<String, String> queryParament,
          Map<String, String> headers,
          Map<String, String> body,
          Future<Map<String, dynamic>> responses) =>
      when(() => login(url: url, endPoint: endPoint, body: body))
          .thenReturn(() async => responses);
}

// class LoginUserBlocMock extends MockBloc<LoginUserEventBloc, LoginUserStateBloc>
//     implements LoginUserBloc {}

class SharePrefrencesAdapterMock extends Mock
    implements SharePrefrencesAdapter {}

void main() {
  // late LoginUserBlocMock sut;
  late FavoriteRespositoryMock favoriteRepositoryImplMock;
  late SharePrefrencesAdapterMock sharePrefrencesAdapterMock;
  Widget makeSut() => const MaterialApp(home: LoginPage());
  final email = faker.internet.email();
  final password = faker.internet.password();

  // final url = "62.171.186.45:8080";
  // final endPoint = "auth";

  setUp(() {
    favoriteRepositoryImplMock = FavoriteRespositoryMock();
    sharePrefrencesAdapterMock = SharePrefrencesAdapterMock();
  });

  testWidgets('Verify all components', (tester) async {
    await tester.pumpWidget(makeSut());

    expect(find.byKey(const Key("button-login")), findsOneWidget);
    expect(find.byType(MyTextFormField), findsNWidgets(2));
    expect(find.byType(Form), findsOneWidget);
  });

  testWidgets("Check if the email and password fields display an error message",
      (tester) async {
    await tester.pumpWidget(makeSut());
    final buttonFinder = find.byKey(const Key("button-login"));
    await tester.tap(buttonFinder);

    await tester.pump();
    expect(find.text("Por favor digite seu E-mail"), findsOneWidget);
    expect(find.text("Por favor digite sua senha"), findsOneWidget);
  });

  testWidgets("Login", (tester) async {
    await tester.pumpWidget(makeSut());

    final textFormFieldFinder = find.byType(MyTextFormField);

    await tester.enterText(textFormFieldFinder.first, email);
    await tester.enterText(textFormFieldFinder.last, password);

    await tester.pump();

    expect(find.text(email), findsOneWidget);
    expect(find.text(password), findsOneWidget);
  });
}
