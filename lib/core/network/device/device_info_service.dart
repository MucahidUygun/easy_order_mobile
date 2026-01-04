abstract class DeviceInfoService {
  Future<void> init();

  String get deviceId;
  String get deviceName;
  String get platform;
  String get userAgent;
}
