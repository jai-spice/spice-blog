import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_bloc.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_event.dart';

final _blocProvider = Provider((ref) => NewSignInBloc());

final _stateProvider = StreamProvider((ref) => ref.watch(_blocProvider).stream);

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ref.watch(_stateProvider).maybeWhen(
              orElse: () => const SizedBox(),
              data: (state) => Text('Email is: ${state.email}'),
            ),
        TextButton(
            onPressed: () => bloc.add(PressHereEvent()),
            child: const Text('Press Here')),
      ],
    ));
  }
}
