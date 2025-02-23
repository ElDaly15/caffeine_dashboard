import 'package:caffeine_dashboard/core/utils/app_colors.dart' show AppColors;
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarForHomePage extends StatelessWidget {
  const CustomAppBarForHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: AppColors.mainColorTheme,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          Text(
            'Caffeine Dashboard',
            style: TextStyles.font20SemiBold(
              context,
            ).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
