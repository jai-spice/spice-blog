import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/auth/datasource/auth_repository.dart';
import 'package:spice_blog/auth/datasource/i_auth_repository.dart';
import 'package:spice_blog/blogs/datasource/blog_repository.dart';
import 'package:spice_blog/common/network_client/network_client.dart';

final networkClientProvider = Provider<INetworkClient>((ref) {
  return NetworkClient();
});

final authRepoProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository(ref.watch(networkClientProvider));
});

final blogRepoProvider = Provider<IBlogRepository>((ref) {
  return BlogRepository(ref.watch(networkClientProvider));
});
