import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:easy_order_mobile/core/network/device/device_info_service.dart';
import 'package:easy_order_mobile/core/network/interceptors/common_headers_interceptor.dart';

Dio createDio(DeviceInfoService deviceInfoService) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://10.0.2.2:7064/api",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(CommonHeadersInterceptor(deviceInfoService));

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      client.userAgent = deviceInfoService.userAgent;
      return client;
    },
  );

  return dio;
}
