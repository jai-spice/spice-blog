import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/common/form/form.dart';
import 'package:spice_blog/di.dart';

enum SignInBlocFormKeys { email, password, isObscure }

class SignInBloc extends FormBloc {
  final Ref _ref;
  SignInBloc(this._ref)
      : super(FormState({
          SignInBlocFormKeys.email: const Email(),
          SignInBlocFormKeys.password: const Password(),
          SignInBlocFormKeys.isObscure: true
        }));

  @override
  void handleOnFormLoadEvent(OnFormLoadEvent event) {
    Logger().i("Form Loaded");
  }

  @override
  Future<void> handleOnFormSubmitEvent(OnFormSubmitEvent event) async {
    final user = await _ref.read(authRepoProvider).signIn(
        email: state.formValues[SignInBlocFormKeys.email].value!,
        password: state.formValues[SignInBlocFormKeys.password].value!);

    if (user != null) {
      emitDone();
    } else {
      emitError("User Not Found");
    }
  }
}
