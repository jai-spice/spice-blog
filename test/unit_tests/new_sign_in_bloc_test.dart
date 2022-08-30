import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_bloc.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_event.dart';
import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_state.dart';

void main() {
  test('Initial state', () async {
    final NewSignInBloc bloc = NewSignInBloc();
    await expectLater(bloc.stream, emitsInOrder([isA<SignInState>()]));
    expect(bloc.state, equals(SignInState.initial()));
  });

  test('On Press Here Event', () async {
    final NewSignInBloc bloc = NewSignInBloc();
    bloc.add(PressHereEvent());

    await expectLater(
      bloc.stream,
      emitsInOrder([
        SignInState.initial(),
        const SignInState("jai@spice.com", "password", true),
      ]),
    );
  });
}
