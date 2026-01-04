import 'package:easy_order_mobile/core/network/device/device_info_providers.dart';
import 'package:easy_order_mobile/core/network/device/device_info_service_impl.dart';
import 'package:easy_order_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final deviceInfoService = DeviceInfoServiceImpl();
  await deviceInfoService.init();
  runApp(ProviderScope(
    overrides: [deviceInfoServiceProvider.overrideWithValue(deviceInfoService)],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyOrderMobileApp',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
