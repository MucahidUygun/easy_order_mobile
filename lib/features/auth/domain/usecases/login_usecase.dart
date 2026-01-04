import 'package:easy_order_mobile/core/security/token_storage.dart';
import 'package:easy_order_mobile/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  final TokenStorage tokenStorage;

  LoginUseCase(this.repository, this.tokenStorage);

  Future<void> call(String email, String password) async {
    final response = await repository.login(email, password);
    await tokenStorage.saveToken(response.token, response.expiration);
  }
}
