import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/small_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/featuers/ads/data/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomAdsItem extends StatelessWidget {
  const CustomAdsItem({
    super.key,
    required this.onDelete,
    required this.onEdit,
    required this.adsModel,
  });
  final void Function() onDelete;
  final void Function() onEdit;
  final AdsModel adsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColorTheme,
                    ),
                  ),
              errorWidget:
                  (context, url, error) => const Icon(
                    Icons.error,
                    size: 40,
                    color: AppColors.mainColorTheme,
                  ),
              imageUrl: adsModel.url,
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10),
          Text(adsModel.title, style: TextStyles.font22Medium(context)),
          const SizedBox(height: 10),

          Row(
            children: [
              SmallElevatedBtmWithIcon(
                onPressed: onEdit,
                title: 'Edit',
                iconData: IconlyBold.edit,
              ),
              SizedBox(width: 12),
              SmallElevatedBtmWithIcon(
                onPressed: onDelete,
                title: 'Delete',
                iconData: IconlyBold.delete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
