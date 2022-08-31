import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/common/form/form.dart';
import 'package:spice_blog/di.dart';

enum SignUpFormKeys {
  firstName,
  lastName,
  email,
  password,
  isObscure,
}

class SignUpBloc extends FormBloc {
  final Ref _ref;

  SignUpBloc(this._ref)
      : super(FormState({
          SignUpFormKeys.firstName: const Name(),
          SignUpFormKeys.lastName: const Name(),
          SignUpFormKeys.email: const Email(),
          SignUpFormKeys.password: const Password(),
          SignUpFormKeys.isObscure: true,
        }));

  @override
  FutureOr<void> handleOnFormLoadEvent(OnFormLoadEvent event) {
    Logger().i("Loaded Sign Up Form");
  }

  @override
  Future<void> handleOnFormSubmitEvent(OnFormSubmitEvent event) async {
    final success = await _ref.read(authRepoProvider).signUp(
          email: state.formValues[SignUpFormKeys.email].value!,
          password: state.formValues[SignUpFormKeys.password].value!,
          firstName: state.formValues[SignUpFormKeys.firstName].value!,
          lastName: state.formValues[SignUpFormKeys.lastName].value!,
        );

    if (success) {
      emitDone();
    } else {
      emitError("Some Error Occured!");
    }
  }
}
