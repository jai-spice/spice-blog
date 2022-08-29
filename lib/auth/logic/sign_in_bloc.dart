// Bloc => Business Logic Component
// Bloc -> Statemanagement (library), Bloc -> Design pattern

import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:spice_blog/auth/datasource/i_auth_repository.dart';
import 'package:spice_blog/auth/logic/validators.dart';
import 'package:spice_blog/common/observable/observable.dart';

class SignInBloc with Validators {
  final IAuthRepository _repository;

  // Member vars
  late final Observable<String?> email = Observable(validator: validateEmail);
  late final Observable<String?> password =
      Observable(validator: validatePassword);
  final Observable<bool> passwordObscure = Observable.seeded(true);

  SignInBloc(this._repository);

  Stream<bool> get validInputObs$ =>
      Rx.combineLatest2(email.obs$, password.obs$, (a, b) => true);

  Future<bool> signIn() async {
    final user = await _repository.signIn(
        email: email.value!, password: password.value!);
    return user != null;
  }

  void dispose() {
    email.dispose();
    password.dispose();
    passwordObscure.dispose();
  }
}
