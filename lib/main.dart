import 'package:caffeine_dashboard/featuers/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CaffeineDashboardApp());
}

class CaffeineDashboardApp extends StatelessWidget {
  const CaffeineDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
