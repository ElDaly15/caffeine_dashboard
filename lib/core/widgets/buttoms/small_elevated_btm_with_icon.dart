import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SmallElevatedBtmWithIcon extends StatelessWidget {
  const SmallElevatedBtmWithIcon({
    super.key,
    required this.title,
    required this.iconData,
    required this.onPressed,
  });
  final String title;
  final IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: AppColors.mainColorTheme,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(iconData, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyles.font18Medium(
              context,
            ).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
