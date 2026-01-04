import 'package:easy_order_mobile/features/auth/data/models/login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login(String email, String password);
}
