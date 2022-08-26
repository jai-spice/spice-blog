import 'package:rxdart/rxdart.dart';
import 'package:spice_blog/auth/datasource/i_auth_repository.dart';
import 'package:spice_blog/auth/logic/validators.dart';
import 'package:spice_blog/common/observable/observable.dart';

class SignUpBloc with Validators {
  final IAuthRepository _authRepository;

  late final Observable<String?> firstName =
      Observable(validator: validateName);
  late final Observable<String?> lastName = Observable(validator: validateName);
  late final Observable<String?> email = Observable(validator: validateEmail);
  late final Observable<String?> password =
      Observable(validator: validatePassword);
  late final Observable<bool> passwordObscure = Observable.seeded(true);

  SignUpBloc(this._authRepository);

  Stream<bool> get validInputObs$ => Rx.combineLatest(
      [firstName.obs$, lastName.obs$, email.obs$, password.obs$],
      (values) => true);

  Future<bool> signUp() => _authRepository.signUp(
        email: email.value!,
        password: password.value!,
        firstName: firstName.value!,
        lastName: lastName.value!,
      );

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
  }
}
