import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.onTap,
    required this.productModel,
  });
  final void Function() onTap;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.mainColorTheme,
      ),
      width: double.infinity,
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
              errorWidget:
                  (context, url, error) =>
                      const Icon(Icons.error, size: 40, color: Colors.white),
              imageUrl: productModel.productImage,
              width: 50,
              fit: BoxFit.cover,
              height: 50,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.productNameEn,
                  style: TextStyles.font18Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '[${productModel.productCode}]',
                  style: TextStyles.font18Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
