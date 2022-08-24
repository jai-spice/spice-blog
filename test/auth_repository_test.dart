import 'package:flutter_test/flutter_test.dart';
import 'package:spice_blog/auth/datasource/i_auth_repository.dart';
import 'package:spice_blog/auth/datasource/models.dart';

import 'mocks/mock_auth_repo.dart';

void main() {
  group('AuthRepo Test', () {
    final IAuthRepository repo = MockAuthRepo();

    test('singleton check', () {
      expect(repo, MockAuthRepo());
    });

    test('login test', () async {
      expect(await repo.signIn(email: '', password: ''), null);

      final actual = await repo.signIn(
          email: 'jai.sachdeva@spicemoney.com', password: 'qwerty12');

      const expected = User(
        email: "jai.sachdeva@spicemoney.com",
        firstName: "Jai",
        lastName: "Sachdeva",
      );
      expect(actual, expected);
    });

    test('sign up test', () async {
      expect(
          await repo.signUp(
            email: '',
            password: '',
            firstName: '',
            lastName: '',
          ),
          true);
    });
  });
}
