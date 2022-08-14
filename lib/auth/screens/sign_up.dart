import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spice_blog/auth/datasource/auth_repository.dart';
import 'package:spice_blog/auth/logic/validators.dart';
import 'package:spice_blog/auth/screens/sign_in.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthRepository repo = AuthRepository();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _showPassword = false;

  Future<void> signUp() async {
    final isSuccess = await repo.signUp(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (mounted) {
      if (isSuccess) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Some error occured!")));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 48.0,
          horizontal: MediaQuery.of(context).size.width / 6,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Sign Up for Spice Blog',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const VerticalSpacing(),
              InputField(
                controller: _firstNameController,
                labelText: 'First Name',
              ),
              const VerticalSpacing(),
              InputField(
                controller: _lastNameController,
                labelText: 'Last Name',
              ),
              const VerticalSpacing(),
              InputField(
                controller: _emailController,
                validator: (value) {
                  return value.validateAsEmail();
                },
                hintText: 'for e.g., abc@xyz.com',
                labelText: 'Email ID',
              ),
              const VerticalSpacing(),
              InputField(
                controller: _passwordController,
                validator: (value) {
                  return value.validateAsPassword();
                },
                suffixIcon: InkWell(
                  child: _showPassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                obscureText: !_showPassword,
                hintText:
                    'Must have at least one uppercase letter, one lowercase letter and one number',
                labelText: 'Password',
              ),
              const VerticalSpacing(),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signUp();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please check the inputs')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                ),
                icon: const Icon(Icons.login),
                label: const Text('Sign Up'),
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
                                    builder: (context) => const SignInPage()),
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
