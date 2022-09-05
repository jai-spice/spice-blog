import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/common/form/form.dart';
import 'package:spice_blog/di.dart';

enum SignInBlocFormKeys { email, password, isObscure }

// []
// {} - set literal if there are only comma separated values
// {} - map literal if there are key values pairs.

// {
//  "key" : "value"
// }

// {
//  "value1", "value2"
// }

class SignInBloc extends FormBloc {
  static const _fields = {
    SignInBlocFormKeys.email: FormField<Email>(
        key: SignInBlocFormKeys.email,
        value: Email(),
        label: 'Email',
        type: FieldType.text),
    SignInBlocFormKeys.password: FormField<Password>(
        key: SignInBlocFormKeys.email,
        value: Password(),
        label: 'Password',
        type: FieldType.text),
    SignInBlocFormKeys.isObscure: FormField<bool>(
        key: SignInBlocFormKeys.isObscure,
        value: false,
        label: 'Password',
        type: FieldType.text),
  };

  final Ref _ref;
  SignInBloc(this._ref) : super(const FormState(_fields));

  @override
  void handleOnFormLoadEvent(OnFormLoadEvent event) {
    Logger().i("Form Loaded");
  }

  @override
  Future<void> handleOnFormSubmitEvent(OnFormSubmitEvent event) async {
    final user = await _ref.read(authRepoProvider).signIn(
        email: state.fields[SignInBlocFormKeys.email]!.value!.toString(),
        password: state.fields[SignInBlocFormKeys.password]!.value!.toString());

    if (user != null) {
      emitDone();
    } else {
      emitError("User Not Found");
    }
  }
}
