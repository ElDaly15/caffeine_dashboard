import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

// ignore: camel_case_types
class MainCopounContainer extends StatelessWidget {
  const MainCopounContainer({
    super.key,
    required this.onTapDelete,
    required this.onTapEdit,
  });
  final void Function() onTapDelete, onTapEdit;
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
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              decoration: BoxDecoration(color: Colors.white),
              child: Icon(
                IconlyLight.discount,
                color: AppColors.mainColorTheme,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'November 2022',
                  style: TextStyles.font18SemiBold(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Caffe25X',
                  style: TextStyles.font14Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '20 % Off',
                  style: TextStyles.font14Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: onTapDelete,
            child: const Icon(IconlyBold.delete, color: Colors.white),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: onTapEdit,
            child: Icon(IconlyBold.edit, color: Colors.white),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
