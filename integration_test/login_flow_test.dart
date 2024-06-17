import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:magicview/main.dart ' as app;
import 'package:magicview/pages/home_pages/components/my_text_form_field.dart';
import 'package:magicview/pages/movie_detail/components/image_favorite_page.dart';
import 'package:magicview/pages/movie_detail/components/show_image_favorite.dart';
import 'package:magicview/utility/hive_initialize.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  testWidgets('Test create favorite', (tester) async {
    HiveInitialize.initializeHive();

    await tester.pumpWidget(
      app.MyApp(),
    );

    final textFormFieldFinder = find.byType(MyTextFormField);
    await tester.enterText(textFormFieldFinder.first, 'lua@koru.com');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.enterText(textFormFieldFinder.last, '123456');
    final buttonFinder = find.byKey(const Key("button-login"));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.tap(buttonFinder, warnIfMissed: true);
    // await tester.pumpAndSettle();

    // await Future.delayed(Duration(seconds: 5));
    await tester.pumpAndSettle(Duration(seconds: 10));

    expect(find.text('MAGICVIEW'), findsOneWidget);
    await Future.delayed(Duration(seconds: 10));

    final moviePopular = find.text('Movie Populares');
    final seriePopular = find.text('Série Populares');
    final listaMovie = find.byType(ListView);

    await tester.tap(listaMovie.first);
    await Future.delayed(Duration(seconds: 5));
    final iconfavoriteBorderFinder = find.byIcon(Icons.favorite_border);
    await tester.tap(iconfavoriteBorderFinder);
    await tester.pumpAndSettle(Duration(seconds: 10));

    expect(find.byType(ShowImageFavorite), findsOneWidget);
    Future.delayed(Duration(seconds: 15));
  });
}
