import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spice_blog/auth/screens/dynamic_sign_in.dart';
import 'package:spice_blog/auth/screens/sign_up.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/blogs/screens/add_blog.dart';
import 'package:spice_blog/blogs/screens/blog_details.dart';
import 'package:spice_blog/blogs/screens/blogs.dart';

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(ProviderScope(
      child: MyApp(
    router: GoRouter(routes: [
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
    ]),
  )));
}

class MyApp extends ConsumerWidget {
  final GoRouter router;
  MyApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
