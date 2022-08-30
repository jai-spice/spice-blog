import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/common/utils/form_bloc.dart';
import 'package:spice_blog/common/value_objects/email.dart';
import 'package:spice_blog/common/value_objects/password.dart';
import 'package:spice_blog/di.dart';

class SignInBloc extends FormBloc {
  static const kEmailKey = 'email';
  static const kPasswordKey = 'password';
  static const kIsObscureKey = 'isObscure';

  final Ref _ref;
  SignInBloc(this._ref)
      : super(FormState({
          kEmailKey: const Email(),
          kPasswordKey: const Password(),
          kIsObscureKey: true
        }));

  @override
  void handleOnFormLoadEvent(OnFormLoadEvent event) {
    Logger().i("Form Loaded");
  }

  @override
  Future<void> handleOnFormSubmitEvent(OnFormSubmitEvent event) async {
    final user = await _ref.read(authRepoProvider).signIn(
        email: state.formValues[kEmailKey].value!,
        password: state.formValues[kPasswordKey].value!);

    if (user != null) {
      emitDone();
    } else {
      emitError("User Not Found");
    }
  }
}
