// Bloc => Business Logic Component
// Bloc -> Statemanagement (library), Bloc -> Design pattern

import 'dart:async';

import 'package:spice_blog/auth/datasource/auth_repository.dart';
import 'package:spice_blog/auth/logic/validators.dart';
import 'package:spice_blog/common/observable/observable.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc with Validators {
  StreamSubscription? _sub;

  SignInBloc() {
    email = Observable(validator: validateEmail);
    password = Observable(validator: validatePassword);
    passwordObscure = Observable.seeded(true);
  }

  late final Observable<String?> email;
  late final Observable<String?> password;
  late final Observable<bool> passwordObscure;

  Stream<bool> get validInputObs$ =>
      Rx.combineLatest2(email.obs$, password.obs$, (a, b) => true);

  Future<void> signIn() async {
    await AuthRepository()
        .signIn(email: email.value!, password: password.value!);
  }

  void dispose() {
    _sub?.cancel();
    _sub = null;
    email.dispose();
    password.dispose();
    passwordObscure.dispose();
  }
}
