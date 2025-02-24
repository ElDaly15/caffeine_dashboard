import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCotnainerOfUserInfo extends StatelessWidget {
  const CustomCotnainerOfUserInfo({
    super.key,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(iconData),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width - 120,
            child: Text(
              title,
              style: TextStyles.font18Medium(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
