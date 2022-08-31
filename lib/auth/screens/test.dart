import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc.dart';
import 'package:spice_blog/auth/logic/sign_up_bloc.dart';
import 'package:spice_blog/common/form/form.dart';

final _blocProvider = Provider(SignInBloc.new);

class NewFormBlocTest extends ConsumerWidget {
  const NewFormBlocTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => bloc.add(const OnFormLoadEvent()),
                child: const Text('Load')),
            TextButton(
                onPressed: () => bloc.add(const OnFormValueUpdateEvent(
                    key: SignUpFormKeys.email, value: "jai@spice.com")),
                child: const Text('Change Email')),
            TextButton(
                onPressed: () => bloc.add(const OnFormValueUpdateEvent(
                    key: SignUpFormKeys.password, value: "password")),
                child: const Text('Change Password')),
            TextButton(
                onPressed: () => bloc.add(const OnFormSubmitEvent()),
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
