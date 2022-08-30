import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spice_blog/common/value_objects/email.dart';
import 'package:spice_blog/common/value_objects/password.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInFormState with _$SignInFormState {
  factory SignInFormState({
    @Default(Email()) Email email,
    @Default(Password()) Password password,
    @Default(true) bool isObscure,
  }) = _SignInFormState;
}
