import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/common/utils/form_bloc.dart';
import 'package:spice_blog/common/value_objects/email.dart';
import 'package:spice_blog/common/value_objects/name.dart';
import 'package:spice_blog/common/value_objects/password.dart';
import 'package:spice_blog/di.dart';

class SignUpBloc extends FormBloc {
  final Ref _ref;

  static const String FIRST_NAME_KEY = 'firstName';
  static const String LAST_NAME_KEY = 'lastName';
  static const String EMAIL_KEY = 'email';
  static const String PASSWORD_KEY = 'password';
  static const String IS_OBSCURE_KEY = 'isObscure';

  SignUpBloc(this._ref)
      : super(FormState({
          FIRST_NAME_KEY: const Name(),
          LAST_NAME_KEY: const Name(),
          EMAIL_KEY: const Email(),
          PASSWORD_KEY: const Password(),
          IS_OBSCURE_KEY: true,
        }));

  @override
  FutureOr<void> handleOnFormLoadEvent(OnFormLoadEvent event) {
    Logger().i("Loaded Sign Up Form");
  }

  @override
  Future<void> handleOnFormSubmitEvent(OnFormSubmitEvent event) async {
    final success = await _ref.read(authRepoProvider).signUp(
          email: state.formValues[EMAIL_KEY].value!,
          password: state.formValues[PASSWORD_KEY].value!,
          firstName: state.formValues[FIRST_NAME_KEY].value!,
          lastName: state.formValues[LAST_NAME_KEY].value!,
        );

    if (success) {
      emitDone();
    } else {
      emitError("Some Error Occured!");
    }
  }
}
