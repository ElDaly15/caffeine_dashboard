import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.isMainAdmin});
  final bool isMainAdmin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody(isMainAdmin: isMainAdmin));
  }
}
