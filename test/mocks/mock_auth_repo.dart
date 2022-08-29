import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([IAuthRepository])
import 'package:spice_blog/auth/datasource/i_auth_repository.dart';
import 'package:spice_blog/auth/datasource/models.dart';

import 'mock_auth_repo.mocks.dart';

final mockAuthRepo = createRepo();

MockIAuthRepository createRepo() {
  final repo = MockIAuthRepository();

  when(repo.signIn()).thenAnswer((realInvocation) async {
    if (realInvocation.namedArguments['email'] ==
            "jai.sachdeva@spicemoney.com" &&
        realInvocation.namedArguments['password'] == "qwerty12") {
      return const User(
          email: "jai.sachdeva@spicemoney.com",
          firstName: "Jai",
          lastName: "Sachdeva");
    }
    return null;
  });

  return repo;
}
// dummy logic or stubs for testing
/*
  User? _user;

  @override
  User? get currentUser => _user;

  @override
  Future<User?> signIn(
      {required String email, required String password}) async {
    if (email == "jai.s@q.com" && password == "qwerty12") {
      _user = const User(
          email: "jai.s@q.com", firstName: "Jai", lastName: "Sachdeva");

    
    
    
  }

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    return true;
  }
 */