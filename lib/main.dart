import 'package:caffeine_dashboard/featuers/home/presentation/views/home_view.dart';
import 'package:caffeine_dashboard/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const CaffeineDashboardApp(),
    ),
  );
}

class CaffeineDashboardApp extends StatelessWidget {
  const CaffeineDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: HomeView(),
    );
  }
}
