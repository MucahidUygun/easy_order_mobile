import 'package:easy_order_mobile/features/auth/data/dataSources/auth_remote_datasource.dart';
import 'package:easy_order_mobile/features/auth/domain/entities/user.dart';
import 'package:easy_order_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<User> login(String email, String password) {
    return remote.login(email, password);
  }
}
