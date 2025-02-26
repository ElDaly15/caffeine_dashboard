import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomBigElevatedBtmWithIcon extends StatelessWidget {
  const CustomBigElevatedBtmWithIcon({
    super.key,
    required this.onPressed,
    required this.title,
    required this.iconData,
  });
  final void Function()? onPressed;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: AppColors.mainColorTheme,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyles.font18SemiBold(
              context,
            ).copyWith(color: Colors.white),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(iconData, color: AppColors.mainColorTheme),
          ),
        ],
      ),
    );
  }
}
