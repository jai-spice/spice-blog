import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc.dart';
import 'package:spice_blog/auth/screens/sign_up.dart';
import 'package:spice_blog/blogs/screens/blogs.dart';
import 'package:spice_blog/common/utils/form_bloc.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/stream_listener.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';

/// Provider to access [SignInBloc]
final _blocProvider = Provider(SignInBloc.new);

/// Distinct state stream from [SignInBloc]
final _stateProvider =
    StreamProvider.autoDispose((ref) => ref.watch(_blocProvider).stream);

/// Error Providers
final _errorProvider = FutureProvider.family.autoDispose((ref, key) => ref
    .watch(_stateProvider.selectAsync((state) => state.formValues[key].error)));

/// Obscure Password Check Provider
final _obscureProvider = FutureProvider.autoDispose((ref) => ref.watch(
    _stateProvider
        .selectAsync((state) => state.formValues[SignInBloc.kIsObscureKey])));

/// Valid Inputs Check Provider
final _validInputProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(_stateProvider.selectAsync((state) => state.isValid())));

/////////////
class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(_blocProvider);

    final emailError =
        ref.watch(_errorProvider(SignInBloc.kEmailKey)).valueOrNull;
    final passwordError =
        ref.watch(_errorProvider(SignInBloc.kPasswordKey)).valueOrNull;

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
              InputField(
                onChanged: (value) => bloc.add(OnFormValueUpdateEvent(
                    key: SignInBloc.kEmailKey, value: value)),
                errorText: emailError,
                labelText: 'Email ID',
                hintText: 'for e.g., abc@xyz.com',
              ),
              const VerticalSpacing(),
              InputField(
                onChanged: (value) => bloc.add(OnFormValueUpdateEvent(
                    key: SignInBloc.kPasswordKey, value: value)),
                errorText: passwordError,
                suffixIcon: InkWell(
                  child: ref.watch(_obscureProvider).value ?? true
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onTap: () => bloc.add(const OnFormValueUpdateEvent(
                      key: SignInBloc.kIsObscureKey, isToggle: true)),
                ),
                obscureText: ref.watch(_obscureProvider).valueOrNull,
                labelText: 'Password',
                hintText: 'Must be more than 8 characters in length',
              ),
              const VerticalSpacing(),
              ElevatedButton.icon(
                onPressed: ref.watch(_validInputProvider).value ?? false
                    ? () => bloc.add(const OnFormSubmitEvent())
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
                    ]),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
