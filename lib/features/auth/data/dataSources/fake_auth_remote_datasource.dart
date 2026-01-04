import 'package:easy_order_mobile/features/auth/data/models/login_response_model.dart';
import 'auth_remote_datasource.dart';

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    return LoginResponseModel(token: 'sadasda', expiration: DateTime.now());
  }
}
