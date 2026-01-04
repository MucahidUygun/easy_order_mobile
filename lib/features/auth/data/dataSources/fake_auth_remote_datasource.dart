import '../models/user_model.dart';
import 'auth_remote_datasource.dart';

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    return UserModel(
      id: "1",
      email: email,
      accessToken: "fake-jwt-token",
    );
  }
}
