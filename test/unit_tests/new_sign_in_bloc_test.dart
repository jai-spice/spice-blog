// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:spice_blog/auth/logic/sign_in_bloc.dart';
// import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_event.dart';
// import 'package:spice_blog/auth/logic/sign_in_bloc/sign_in_state.dart';
// import 'package:spice_blog/common/form/form.dart';
// import 'package:spice_blog/di.dart';

// import '../mocks/mock_auth_repo.dart';

// class Listener<T> extends Mock {
//   void call(T? previous, T value);
// }

// void main() {
//   group('[SignInBloc] Test', () async {
//     final container = ProviderContainer();
//     addTearDown(container.dispose);
//     final listener = Listener();
//     container.listen(authRepoProvider, listener, fireImmediately: true);
//     listener(null, mockAuthRepo);
//     // test('Initial state', () async {
//     //   const bloc = SignInBloc.new;
//     //   await expectLater(bloc.stream, emitsInOrder([isA<SignInFormState>()]));
//     //   expect(bloc.state, equals(SignInFormState()));
//     // });

//     test('Valid Input Test', () async {
//       final signInFormState = SignInFormState();
//       final signInFormStateWithEmail =
//           signInFormState.copyWith(email: const Email("j.s@q.com"));
//       final signInFormStateWithValidInput = signInFormStateWithEmail.copyWith(
//           password: const Password("qwerty12"));
//       final signInFormStateWithComplete =
//           signInFormStateWithValidInput.copyWith(isComplete: true);

//       final SignInBloc bloc = SignInBloc(container.read(authRepoProvider));
//       bloc
//         ..add(const UpdateEmailEvent("j.s@q.com"))
//         ..add(const UpdatePasswordEvent("qwerty12"))
//         ..add(SignInPressedEvent());

//       await expectLater(
//         bloc.stream,
//         emitsInOrder([
//           signInFormState,
//           signInFormStateWithEmail,
//           signInFormStateWithValidInput,
//           signInFormStateWithComplete
//         ]),
//       );
//     });
//     test('Wrong Credentials Test', () async {
//       final signInFormState = SignInFormState();
//       final signInFormStateWithEmail = signInFormState.copyWith(
//           email: const Email("j2.s@q.com"));
//       final signInFormStateWithValidInput = signInFormStateWithEmail.copyWith(
//           password: const Password("qwerty12"));
//       final signInFormStateWithError =
//           signInFormStateWithValidInput.copyWith(error: "User not found");

//       final SignInBloc bloc = SignInBloc(container.read(authRepoProvider));
//       bloc
//         ..add(const UpdateEmailEvent("j2.s@q.com"))
//         ..add(const UpdatePasswordEvent("qwerty12"))
//         ..add(SignInPressedEvent());

//       await expectLater(
//         bloc.stream,
//         emitsInOrder([
//           signInFormState,
//           signInFormStateWithEmail,
//           signInFormStateWithValidInput,
//           signInFormStateWithError,
//         ]),
//       );
//     });
//     test('Invalid Input Test', () async {
//       final signInFormState = SignInFormState();
//       final signInFormStateWithEmail =
//           signInFormState.copyWith(email: const Email("jai.sach.com"));
//       final signInFormStateWithInvalidInput = signInFormStateWithEmail.copyWith(
//           password: const Password("qwerty1"));

//       final SignInBloc bloc = SignInBloc(container.read(authRepoProvider));
//       bloc
//         ..add(const UpdateEmailEvent("jai.sach.com"))
//         ..add(const UpdatePasswordEvent("qwerty1"))
//         ..add(SignInPressedEvent());

//       await expectLater(
//         bloc.stream,
//         emitsInOrder([
//           signInFormState,
//           signInFormStateWithEmail,
//           signInFormStateWithInvalidInput,
//         ]),
//       );
//     });
//   });
// }
