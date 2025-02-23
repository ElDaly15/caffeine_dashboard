import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/custom_header_for_home.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.mainColorTheme,
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        CustomAppBarForHomePage(),
      ],
    );
  }
}
