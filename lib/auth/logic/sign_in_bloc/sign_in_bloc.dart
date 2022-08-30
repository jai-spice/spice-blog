import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_event.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_state.dart';
import 'package:spice_blog/common/utils/bloc_base.dart';
import 'package:spice_blog/common/value_objects/email.dart';
import 'package:spice_blog/di.dart';

import '../../../common/value_objects/password.dart';

class SignInBloc extends Bloc<SignInEvent, SignInFormState> {
  final Ref _ref;

  SignInBloc(this._ref) : super(SignInFormState()) {
    on<UpdateEmailEvent>(_handleUpdateEmailEvent);
    on<UpdatePasswordEvent>(_handleUpdatePasswordEvent);
    on<ObscurePasswordEvent>(_handleObscurePasswordEvent);
    on<SignInPressedEvent>(_handleSignInPressedEvent);
  }

  FutureOr<void> _handleUpdateEmailEvent(UpdateEmailEvent event) {
    emit(state.copyWith(email: Email(event.value)));
  }

  FutureOr<void> _handleUpdatePasswordEvent(UpdatePasswordEvent event) {
    emit(state.copyWith(password: Password(event.value)));
  }

  FutureOr<void> _handleObscurePasswordEvent(ObscurePasswordEvent _) {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  Future<void> _handleSignInPressedEvent(SignInPressedEvent _) async {
    final user = await _ref
        .read(authRepoProvider)
        .signIn(email: state.email.value!, password: state.password.value!);

    if (user != null) {
      emitDone();
    } else {
      emitError("User Not Found");
    }
  }
}
