import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/auth/logic/sign_up_bloc.dart';
import 'package:spice_blog/auth/screens/dynamic_sign_in.dart';
import 'package:spice_blog/common/form/form.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/stream_listener.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';

final blocProvider = Provider(SignUpBloc.new);

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(blocProvider);
    return StreamListener(
      stream: bloc.stream,
      onDone: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SignInPage()));
      },
      onError: (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$error")));
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 48.0,
            horizontal: MediaQuery.of(context).size.width / 6,
          ),
          child: Column(
            children: [
              const Text(
                'Sign Up for Spice Blog',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const VerticalSpacing(),
              StreamedFormInputField(
                labelText: 'First Name',
                valueKey: SignUpFormKeys.firstName,
                blocProvider: blocProvider,
              ),
              const VerticalSpacing(),
              StreamedFormInputField(
                labelText: 'Last Name',
                valueKey: SignUpFormKeys.lastName,
                blocProvider: blocProvider,
              ),
              const VerticalSpacing(),
              StreamedFormInputField(
                labelText: 'Email',
                valueKey: SignUpFormKeys.email,
                blocProvider: blocProvider,
              ),
              const VerticalSpacing(),
              StreamBuilder<bool?>(
                  initialData: true,
                  stream: bloc.stream.map(
                      (event) => event.formValues[SignUpFormKeys.isObscure]),
                  builder: (context, obscureSnap) {
                    return StreamedFormInputField(
                      blocProvider: blocProvider,
                      labelText: 'Password',
                      valueKey: SignUpFormKeys.password,
                      suffixIcon: InkWell(
                        child: !obscureSnap.data!
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          bloc.add(const FormEvent.onUpdate(
                              key: SignUpFormKeys.isObscure, isToggle: true));
                        },
                      ),
                      obscureText: obscureSnap.data,
                    );
                  }),
              const VerticalSpacing(),
              StreamBuilder<bool>(
                  stream: bloc.stream.map((event) => event.isValid()),
                  builder: (context, snapshot) {
                    final isValid = snapshot.data ?? false;
                    return ElevatedButton.icon(
                      onPressed: isValid
                          ? () => bloc.add(const FormEvent.onSubmit())
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                      ),
                      icon: const Icon(Icons.login),
                      label: const Text('Sign Up'),
                    );
                  }),
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
                                  builder: (context) => const SignInPage(),
                                ),
                              );
                            }),
                      const TextSpan(text: 'instead.'),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
