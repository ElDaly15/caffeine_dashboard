import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfSelectionItemInDashboard extends StatelessWidget {
  const ContainerOfSelectionItemInDashboard({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });
  final String title;
  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.mainColorTheme,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Spacer(),
            Icon(icon, color: Colors.white, size: 60),
            SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: TextStyles.font20SemiBold(
                  context,
                ).copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
