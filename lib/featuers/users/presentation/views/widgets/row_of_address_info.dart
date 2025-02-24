import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class RowOfAddressInfo extends StatelessWidget {
  const RowOfAddressInfo({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyles.font18SemiBold(context).copyWith()),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.46,
          child: Text(
            subTitle,
            style: TextStyles.font18SemiBold(
              context,
            ).copyWith(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
