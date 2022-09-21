import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:spice_blog/auth/screens/dynamic_sign_in.dart';
import 'package:spice_blog/auth/screens/sign_up.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/blogs/screens/add_blog.dart';
import 'package:spice_blog/blogs/screens/blog_details.dart';
import 'package:spice_blog/blogs/screens/blogs.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/di.dart';
import 'package:spice_blog/main.dart';

import '../mocks/mock_auth_repo.dart';

void main() {
  late GoRouter router;
  setUpAll(() {
    router = GoRouter(routes: [
      GoRoute(
          path: SignInPage.route,
          builder: (context, state) => const SignInPage()),
      GoRoute(
          path: SignUpPage.route,
          builder: (context, state) => const SignUpPage()),
      GoRoute(
          path: BlogFeed.route,
          builder: (context, state) => const BlogFeed(),
          routes: [
            GoRoute(
              path: AddBlogPage.route,
              builder: (context, state) => const AddBlogPage(),
            ),
            GoRoute(
              path: BlogDetails.route,
              builder: (context, state) => BlogDetails(
                blog: state.extra! as Blog,
              ),
            ),
          ])
    ]);
  });
  testWidgets('SignInPage Widget Test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(ProviderScope(
      overrides: [authRepoProvider.overrideWithValue(mockAuthRepo)],
      child: MyApp(router: router),
    ));
    //
    await tester.pumpAndSettle();
    expect(emailInput, findsOneWidget);

    await tester.enterText(emailInput, 'abc');
    await tester.pumpAndSettle(); // setState
    expect(find.text('abc'), findsOneWidget);

    expect(
        tester.widget<InputField>(emailInput).errorText, 'Not a valid email');

    await tester.enterText(emailInput, 'abc@xyz.com');
    await tester.pumpAndSettle(); // setState
    // expect(find.text('abc@xyz.com'), findsOneWidget);
    // expect(tester.widget<InputField>(emailInput).errorText, null);

    // await tester.tap(find.byKey(const ValueKey('sign_in_submit_button')));
    // await tester.pumpAndSettle(); // setState
    await tester.enterText(
        find.byKey(const ValueKey('password_input_field')), 'qiuweiwuqwie');
    await tester.pumpAndSettle(); // setState

    await tester.tap(find.byKey(const ValueKey('sign_in_submit_button')));
    await tester.pumpAndSettle();
    expect(router.location, SignInPage.route);
    // setState

    await tester.enterText(emailInput, 'jai.s@q.com');
    await tester.pumpAndSettle(); // setState
    await tester.enterText(
        find.byKey(const ValueKey('password_input_field')), 'qwerty12');
    await tester.pumpAndSettle(); // setState
    await tester.tap(find.byKey(const ValueKey('sign_in_submit_button')));
    await tester.pumpAndSettle();
  });
}

Finder get emailInput => find.byKey(const ValueKey('email_input_field'));
