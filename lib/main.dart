import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/auth/screens/new_sign_in.dart';
import 'package:spice_blog/blogs/screens/blogs.dart';
import 'package:spice_blog/di.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.watch(authRepoProvider);
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spice Blog',
        home: SignInPage()
        // authRepo.currentUser == null ? const SignInPage() : const BlogFeed(),
        );
  }
}
