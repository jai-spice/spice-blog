import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_bloc.dart';
import 'package:spice_blog/auth/screens/sign_up.dart';
import 'package:spice_blog/blogs/screens/blogs.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';
import 'package:spice_blog/di.dart';

final _blocProvider =
    Provider((ref) => SignInBloc(ref.watch(authRepoProvider)));

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 48.0,
          horizontal: MediaQuery.of(context).size.width / 6,
        ),
        child: Column(
          children: [
            const Text(
              'Sign In to Spice Blog',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const VerticalSpacing(),
            //
            const EmailInputWidget(),
            //
            const VerticalSpacing(),
            //
            const PasswordInputWidget(),
            //
            const VerticalSpacing(),
            //
            const SignInSubmitButton(),
            //
            const VerticalSpacing(),
            RichText(
              text: TextSpan(
                  text: 'Not a user yet?',
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  children: [
                    TextSpan(
                        text: ' Sign Up ',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()),
                            );
                          }),
                    const TextSpan(text: 'instead.'),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInSubmitButton extends ConsumerWidget {
  const SignInSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);
    return StreamBuilder<bool>(
        stream: bloc.validInputObs$,
        builder: (context, snapshot) {
          final isValid = snapshot.data ?? false;
          return ElevatedButton.icon(
            key: const ValueKey('sign_in_submit_button'),
            onPressed: isValid
                ? () async {
                    if (await bloc.signIn()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const BlogFeed()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User not found')),
                      );
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
            ),
            icon: const Icon(Icons.login),
            label: const Text('Sign In'),
          );
        });
  }
}

class PasswordInputWidget extends ConsumerWidget {
  const PasswordInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);
    return StreamBuilder(
        stream: bloc.password.obs$,
        builder: (context, snapshot) {
          return StreamBuilder<bool>(
              stream: bloc.passwordObscure.obs$,
              initialData: true,
              builder: (context, obscureSnap) {
                return InputField(
                  key: const ValueKey('password_input_field'),
                  onChanged: bloc.password.addValue,
                  suffixIcon: InkWell(
                    child: !obscureSnap.data!
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onTap: () {
                      bloc.passwordObscure.addValue(!obscureSnap.data!);
                    },
                  ),
                  obscureText: obscureSnap.data,
                  errorText: snapshot.error as String?,
                  hintText:
                      'Must have at least one uppercase letter, one lowercase letter and one number',
                  labelText: 'Password',
                );
              });
        });
  }
}

class EmailInputWidget extends ConsumerWidget {
  const EmailInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);

    return StreamBuilder<String?>(
        stream: bloc.email.obs$,
        builder: (context, snapshot) {
          return InputField(
            key: const ValueKey('email_input_field'),
            onChanged: bloc.email.addValue,
            hintText: 'for e.g., abc@xyz.com',
            labelText: 'Email ID',
            errorText: snapshot.error as String?,
          );
        });
  }
}
