import 'dart:js';

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
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SignInPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
    GoRoute(
        path: '/blogs',
        builder: (context, state) => const BlogFeed(),
        routes: [
          GoRoute(
            path: AddBlogPage.route,
            builder: (context, state) => const AddBlogPage(),
          ),
          GoRoute(
            path: 'details',
            builder: (context, state) => BlogDetails(
              blog: state.extra! as Blog,
            ),
          ),
        ])
  ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
