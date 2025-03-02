import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ManageOrderContainer extends StatelessWidget {
  const ManageOrderContainer({
    super.key,
    required this.isActive,
    required this.title,
    required this.onTap,
  });
  final bool isActive;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColorTheme, width: 2),
          borderRadius: BorderRadius.circular(6),
          color: isActive ? Colors.white : AppColors.mainColorTheme,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.font18Medium(context).copyWith(
              color: isActive ? AppColors.mainColorTheme : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
