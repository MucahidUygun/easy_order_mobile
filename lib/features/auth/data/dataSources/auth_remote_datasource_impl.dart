import 'package:easy_order_mobile/core/network/api_client.dart';
import 'package:easy_order_mobile/features/auth/data/dataSources/auth_remote_datasource.dart';
import 'package:easy_order_mobile/features/auth/data/models/login_response_model.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDatasourceImpl(this.apiClient);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final response = await apiClient
        .post('/Auth/Login', data: {"email": email, "password": password});
    return LoginResponseModel.fromJson(response.data);
  }
}
