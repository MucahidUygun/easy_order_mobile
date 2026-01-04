import 'package:easy_order_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:easy_order_mobile/features/auth/presentation/state/login_state.dart';
import 'package:flutter_riverpod/legacy.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase loginUsecase;

  LoginNotifier(this.loginUsecase) : super(LoginState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await loginUsecase(email, password);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Giriş başarısız");
    }
  }
}
