abstract class SignInEvent {
  const SignInEvent();
}

class UpdateEmailEvent extends SignInEvent {
  final String? value;
  const UpdateEmailEvent(this.value);
}

class UpdatePasswordEvent extends SignInEvent {
  final String? value;
  const UpdatePasswordEvent(this.value);
}

class ObscurePasswordEvent extends SignInEvent {}

class SignInPressedEvent extends SignInEvent {}
