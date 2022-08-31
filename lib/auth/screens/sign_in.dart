import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_bloc.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_event.dart';
import 'package:spice_blog/auth/screens/sign_up.dart';
import 'package:spice_blog/blogs/screens/blogs.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/stream_listener.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';

/// Provider to access [SignInBloc]
final _blocProvider = Provider(SignInBloc.new);

/// Distinct state stream from [SignInBloc]
final _stateProvider =
    StreamProvider.autoDispose((ref) => ref.watch(_blocProvider).stream);

/// Error Providers
final _emailErrorProvider = FutureProvider.autoDispose((ref) =>
    ref.watch(_stateProvider.selectAsync((state) => state.email.error)));
final _passwordErrorProvider = FutureProvider.autoDispose((ref) =>
    ref.watch(_stateProvider.selectAsync((state) => state.password.error)));

/// Obscure Password Check Provider
final _obscureProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(_stateProvider.selectAsync((state) => state.isObscure)));

/// Valid Inputs Check Provider
final _validInputProvider = FutureProvider.autoDispose((ref) => ref.watch(
    _stateProvider.selectAsync(
        (state) => !state.email.hasError() && !state.password.hasError())));

/////////////
class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamListener(
      stream: ref.watch(_blocProvider).stream,
      onDone: () {
        Logger().i("Login success!");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const BlogFeed(),
          ),
        );
      },
      onError: (error) => Logger().e(error),
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _EmailInput(),
              const VerticalSpacing(),
              const _PasswordInput(),
              const VerticalSpacing(),
              ElevatedButton.icon(
                onPressed: ref.watch(_validInputProvider).value ?? false
                    ? () => ref.read(_blocProvider).add(SignInPressedEvent())
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                ),
                icon: const Icon(Icons.login),
                label: const Text('Sign In'),
              ),
              const VerticalSpacing(),
              RichText(
                text: TextSpan(
                  text: 'Already a user?',
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  children: [
                    TextSpan(
                        text: ' Sign In ',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          }),
                    const TextSpan(text: 'instead.'),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  const _PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordError = ref.watch(_passwordErrorProvider).valueOrNull;
    final obscureText = ref.watch(_obscureProvider).valueOrNull;
    return InputField(
      onChanged: (value) =>
          ref.read(_blocProvider).add(UpdatePasswordEvent(value)),
      errorText: passwordError,
      suffixIcon: InkWell(
        child: ref.watch(_obscureProvider).value ?? true
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
        onTap: () => ref.read(_blocProvider).add(ObscurePasswordEvent()),
      ),
      obscureText: obscureText,
      labelText: 'Password',
      hintText: 'Must be more than 8 characters in length',
    );
  }
}

class _EmailInput extends ConsumerWidget {
  const _EmailInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailError = ref.watch(_emailErrorProvider).valueOrNull;

    return InputField(
      onChanged: (value) =>
          ref.read(_blocProvider).add(UpdateEmailEvent(value)),
      errorText: emailError,
      labelText: 'Email ID',
      hintText: 'for e.g., abc@xyz.com',
    );
  }
}
