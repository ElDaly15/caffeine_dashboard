import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_images.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.mainColorTheme,
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(Assets.imagesIcLauncher, scale: 10),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coffe Latte ',
                  style: TextStyles.font18Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'S | Quantity: 1',
                  style: TextStyles.font14Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '23XEP3213XS2313',
                  style: TextStyles.font14Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            'On  Delivery',
            style: TextStyles.font18Medium(
              context,
            ).copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
