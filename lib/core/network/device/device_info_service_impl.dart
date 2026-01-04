import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_order_mobile/core/network/device/device_info_service.dart';

class DeviceInfoServiceImpl implements DeviceInfoService {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  late final String _deviceId;
  late final String _deviceName;
  late final String _platform;
  late final String _userAgent;

  @override
  Future<void> init() async {
    _platform = Platform.operatingSystem;
    final info = await PackageInfo.fromPlatform();
    _userAgent = '${info.appName}/${info.version}';

    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      _deviceId = info.id;
      _deviceName = '${info.manufacturer} ${info.model}';
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      _deviceId = info.identifierForVendor ?? 'unknown';
      _deviceName = info.name;
    } else {
      _deviceId = 'unknown';
      _deviceName = 'unknown';
    }
  }

  @override
  String get deviceId => _deviceId;

  @override
  String get deviceName => _deviceName;

  @override
  String get platform => _platform;

  @override
  String get userAgent => _userAgent;
}
