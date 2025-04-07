import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi/core/config/routes.dart';
import 'package:taxi/core/config/theme/light_theme.dart';
import 'package:taxi/core/services/one_signal/onesignal_service.dart';
import 'package:taxi/presentation/provider/auth_provider.dart';
import 'package:taxi/presentation/provider/yonalish_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_)=> YonalishViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    OneSignalService().initOneSignal(); // OneSignalni boshlash
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      initialRoute: AppRoutes.yonalish,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
