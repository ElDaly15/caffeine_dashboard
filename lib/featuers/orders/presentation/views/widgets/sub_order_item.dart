import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine_dashboard/core/models/cart_model.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SubOrderItem extends StatelessWidget {
  const SubOrderItem({super.key, required this.cartModel});
  final CartModel cartModel;

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
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
              errorWidget:
                  (context, url, error) =>
                      const Icon(Icons.error, size: 40, color: Colors.white),
              imageUrl: cartModel.productImage,
              width: 50,
              fit: BoxFit.cover,
              height: 50,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartModel.productNameEn,
                  style: TextStyles.font18Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${cartModel.sizeEn} | Quantity: ${cartModel.quantity}',
                  style: TextStyles.font14Medium(
                    context,
                  ).copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '[${cartModel.productCode}]',
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
            '${cartModel.sizeEn == 'S'
                ? cartModel.productPriceS
                : cartModel.sizeEn == 'M'
                ? cartModel.productPriceM
                : cartModel.productPriceL} EGP',
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
