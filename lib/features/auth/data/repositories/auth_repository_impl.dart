import 'package:easy_order_mobile/features/auth/data/dataSources/auth_remote_datasource.dart';
import 'package:easy_order_mobile/features/auth/data/models/login_response_model.dart';
import 'package:easy_order_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<LoginResponseModel> login(String email, String password) {
    return remote.login(email, password);
  }
}
