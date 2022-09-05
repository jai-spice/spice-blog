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

  static const _formFields = {
    SignUpFormKeys.firstName: FormField<Name>(
        key: SignUpFormKeys.firstName,
        value: Name(),
        label: 'First name',
        type: FieldType.text),
    SignUpFormKeys.lastName: FormField<Name>(
        key: SignUpFormKeys.lastName,
        value: Name(),
        label: 'Last Name',
        type: FieldType.text),
    SignUpFormKeys.email: FormField<Email>(
        key: SignUpFormKeys.email,
        value: Email(),
        label: 'Email',
        type: FieldType.text),
    SignUpFormKeys.password: FormField<Password>(
        key: SignUpFormKeys.email,
        value: Password(),
        label: 'Password',
        type: FieldType.text),
    SignUpFormKeys.isObscure: FormField<bool>(
        key: SignUpFormKeys.isObscure,
        value: false,
        label: 'Password',
        type: FieldType.text),
  };

  SignUpBloc(this._ref) : super(const FormState(_formFields));

  @override
  FutureOr<void> handleOnFormLoadEvent(OnFormLoadEvent event) {
    Logger().i("Loaded Sign Up Form");
  }

  @override
  Future<void> handleOnFormSubmitEvent(OnFormSubmitEvent event) async {
    final success = await _ref.read(authRepoProvider).signUp(
          email: state.fields[SignUpFormKeys.email]!.value!,
          password: state.fields[SignUpFormKeys.password]!.value!,
          firstName: state.fields[SignUpFormKeys.firstName]!.value!,
          lastName: state.fields[SignUpFormKeys.lastName]!.value!,
        );

    if (success) {
      emitDone();
    } else {
      emitError("Some Error Occured!");
    }
  }
}
