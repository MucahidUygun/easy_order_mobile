import 'package:dio/dio.dart';
import 'package:easy_order_mobile/core/network/api_client.dart';
import 'package:easy_order_mobile/core/network/device/device_info_providers.dart';
import 'package:easy_order_mobile/core/network/dio_client.dart';
import 'package:easy_order_mobile/features/auth/data/dataSources/auth_remote_datasource.dart';
import 'package:easy_order_mobile/features/auth/data/dataSources/auth_remote_datasource_impl.dart';
import 'package:easy_order_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:easy_order_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:easy_order_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:easy_order_mobile/features/auth/presentation/notifier/login_notifier.dart';
import 'package:easy_order_mobile/features/auth/presentation/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final dioProvider = Provider<Dio>((ref) {
  final deviceInfoService = ref.read(deviceInfoServiceProvider);
  return createDio(deviceInfoService);
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.read(dioProvider));
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDatasourceImpl(ref.read(apiClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref.read(loginUseCaseProvider));
});
