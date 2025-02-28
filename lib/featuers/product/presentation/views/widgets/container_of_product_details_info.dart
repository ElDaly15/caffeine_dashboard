import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfDetailsView extends StatelessWidget {
  const ContainerOfDetailsView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isArabic,
  });
  final String title, subTitle;
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
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
      child: Column(
        crossAxisAlignment:
            isArabic ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.font18Bold(context).copyWith(
              color: Colors.black,
              fontFamily: isArabic ? 'Alexandria' : 'Sora',
            ),
          ),
          Text(
            subTitle,
            style: TextStyles.font18Medium(context).copyWith(
              color: Colors.black,
              fontFamily: isArabic ? 'Alexandria' : 'Sora',
            ),
          ),
        ],
      ),
    );
  }
}
