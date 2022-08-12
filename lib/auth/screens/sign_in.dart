import 'package:flutter/material.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';
import 'package:spice_blog/auth/logic/validators.dart';
import 'package:spice_blog/blogs/screens/blogs.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  Future<void> login() async {
    if (_emailController.text == "jai@spice.com" &&
        _passwordController.text == "qwerty12") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BlogFeed()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User not found')));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                'Sign In to Spice Blog',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    login();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please check the inputs')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                ),
                icon: const Icon(Icons.login),
                label: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
