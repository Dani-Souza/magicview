import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magicview/bloc/login_user_bloc/login_user_bloc.dart';
import 'package:magicview/pages/home_pages/components/my_text_form_field.dart';
import 'package:magicview/pages/login_page/login_page.dart';
import 'package:mocktail/mocktail.dart';

class LoginUserBlocMock extends MockBloc<LoginUserEventBloc, LoginUserStateBloc>
    implements LoginUserBloc {}

void main() {
  late LoginUserBlocMock sut;

  setUp(() {
    sut = LoginUserBlocMock();
    // HttpOverrides.global = null;
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<LoginUserBloc>(
      create: (context) => sut,
      child: MaterialApp(home: body),
    );
  }

  final email = faker.internet.email();
  final password = faker.internet.password();

  testWidgets('Verify all components', (tester) async {
    when(() => sut.state).thenReturn(LoginUserInitializeState());
    await tester.pumpWidget(_makeTestableWidget(LoginPage(
      loginUserBloc: sut,
    )));

    expect(find.byKey(const Key("button-login")), findsOneWidget);
    expect(find.byType(MyTextFormField), findsNWidgets(2));
    expect(find.byType(Form), findsOneWidget);
  });

  testWidgets("Check if the email and password fields display an error message",
      (tester) async {
    when(() => sut.state).thenReturn(LoginUserInitializeState());
    await tester.pumpWidget(_makeTestableWidget(LoginPage(
      loginUserBloc: sut,
    )));
    final buttonFinder = find.byKey(const Key("button-login"));
    await tester.tap(buttonFinder);

    //await tester.pump();
    await tester.pumpAndSettle();
    expect(find.text("Por favor digite seu E-mail"), findsOneWidget);
    expect(find.text("Por favor digite sua senha"), findsOneWidget);
  });

  testWidgets("Fill in email and password fields", (tester) async {
    when(() => sut.state).thenReturn(LoginUserLoadingState());
    await tester.pumpWidget(_makeTestableWidget(LoginPage(
      loginUserBloc: sut,
    )));

    final textFormFieldFinder = find.byType(MyTextFormField);

    await tester.enterText(textFormFieldFinder.first, email);
    await tester.enterText(textFormFieldFinder.last, password);

    await tester.pump();

    expect(find.text(email), findsOneWidget);
    expect(find.text(password), findsOneWidget);

    final buttonFinder = find.byKey(const Key("button-login"));
    await tester.tap(buttonFinder);
  });
}
