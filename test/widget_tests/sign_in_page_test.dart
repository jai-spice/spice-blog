import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spice_blog/auth/screens/sign_in.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/di.dart';

import '../mocks/mock_auth_repo.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  //
  testWidgets('SignInPage Widget Test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(ProviderScope(
      overrides: [authRepoProvider.overrideWithValue(mockAuthRepo)],
      child: MaterialApp(
        home: const SignInPage(),
        navigatorObservers: [mockObserver],
      ),
    ));
    //
    final titleFinder = find.text('Sign In to Spice Blog');
    expect(titleFinder, findsOneWidget);

    expect(emailInput, findsOneWidget);

    await tester.enterText(emailInput, 'abc');
    await tester.pumpAndSettle(); // setState
    expect(find.text('abc'), findsOneWidget);

    expect(
        tester.widget<InputField>(emailInput).errorText, 'Not a valid email');

    await tester.enterText(emailInput, 'abc@xyz.com');
    await tester.pumpAndSettle(); // setState
    expect(find.text('abc@xyz.com'), findsOneWidget);
    expect(tester.widget<InputField>(emailInput).errorText, null);

    await tester.tap(find.byKey(const ValueKey('sign_in_submit_button')));
    await tester.pumpAndSettle(); // setState

    await tester.enterText(
        find.byKey(const ValueKey('password_input_field')), 'qiuweiwuqwie');
    await tester.pumpAndSettle(); // setState

    await tester.tap(find.byKey(const ValueKey('sign_in_submit_button')));
    await tester.pumpAndSettle(); // setState
    expect(find.text('User not found', skipOffstage: false), findsOneWidget);

    await tester.enterText(emailInput, 'jai.sachdeva@spicemoney.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_input_field')), 'qwerty12');
    await tester.pumpAndSettle(); // setState
    await tester.tap(find.byKey(const ValueKey('sign_in_submit_button')));

    await tester.pumpAndSettle();
    verify(mockObserver.didReplace(
        newRoute: anyNamed('newRoute'), oldRoute: anyNamed('oldRoute')));
  });
}

Finder get emailInput => find.byKey(const ValueKey('email_input_field'));
