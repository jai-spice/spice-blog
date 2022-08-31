import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/auth/datasource/i_auth_repository.dart';
import 'package:spice_blog/auth/datasource/models.dart';
import 'package:spice_blog/di.dart';

class AuthRepository implements IAuthRepository {
  final Ref _ref;

  AuthRepository(this._ref); // Private Constructor

  User? _user;
  @override
  User? get currentUser => _user;

  @override
  Future<User?> signIn(
      {required String email, required String password}) async {
    final response = await _ref.read(networkClientProvider).post(
      'login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      _user = User.fromJson(json.decode(response.body));
    }

    return _user;
  }

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final response = await _ref.read(networkClientProvider).post(
      'signup',
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      },
    );

    return response.statusCode == 200;
  }
}
