import 'package:equatable/equatable.dart';

class SignInState with EquatableMixin {
  final String? email;
  final String? password;

  final bool isObscure;

  const SignInState(this.email, this.password, this.isObscure);

  factory SignInState.initial() => const SignInState(null, null, true);

  @override
  List<Object?> get props => [email, password, isObscure];
}
