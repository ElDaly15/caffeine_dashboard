import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/container_of_product_details_info.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_user_info.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
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
                imageUrl: productModel.productImage,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),

          sliver: SliverToBoxAdapter(
            child: ContainerOfDetailsView(
              title: 'Product Name [En]',
              subTitle: productModel.productNameEn,
              isArabic: false,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),

          sliver: SliverToBoxAdapter(
            child: ContainerOfDetailsView(
              title: 'اسم المنتج [عربي]',
              subTitle: productModel.productNameAr,
              isArabic: true,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: ContainerOfDetailsView(
              title: 'Product Description [En]',
              subTitle: productModel.productDescriptionEn,
              isArabic: false,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),

          sliver: SliverToBoxAdapter(
            child: ContainerOfDetailsView(
              title: 'وصف المنتج [عربي]',
              subTitle: productModel.productDescriptionAr,
              isArabic: true,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: '${productModel.productPriceS} L.E [Small]',
              iconData: IconlyLight.wallet,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: '${productModel.productPriceM} L.E [Medium]',
              iconData: IconlyLight.wallet,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: '${productModel.productPriceL} L.E [Large]',
              iconData: IconlyLight.wallet,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: productModel.productInfo,
              iconData: IconlyLight.info_square,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),

          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title:
                  '${NumberFormat("#.#").format(productModel.rating / productModel.ratingCount)} (${productModel.ratingCount} Ratings)',
              iconData: IconlyBold.star,
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: productModel.productCategory,
              iconData: IconlyLight.category,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
      ],
    );
  }
}
