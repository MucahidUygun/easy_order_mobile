import 'package:dio/dio.dart';
import 'package:easy_order_mobile/core/network/app_headers.dart';
import 'package:easy_order_mobile/core/network/device/device_info_service.dart';

class CommonHeadersInterceptor extends Interceptor {
  final DeviceInfoService deviceInfoService;

  CommonHeadersInterceptor(this.deviceInfoService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      AppHeaders.xDeviceId: deviceInfoService.deviceId,
      AppHeaders.xDeviceName: deviceInfoService.deviceName,
      AppHeaders.xPlatform: deviceInfoService.platform,
      AppHeaders.userAgent: deviceInfoService.userAgent,
    });
    handler.next(options);
  }
}
