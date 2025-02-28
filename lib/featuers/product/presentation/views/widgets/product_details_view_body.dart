import 'package:caffeine_dashboard/core/utils/app_images.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/container_of_product_details_info.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_user_info.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

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
              child: Image.asset(
                Assets.imagesLogoCaffeineDashboard,
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
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
              subTitle: 'Cafe Latte',
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
              subTitle: 'كافية لاتيه',
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
              subTitle:
                  'Café Latte – Smooth & Creamy Perfection Indulge in the rich and velvety taste of our Café Latte, crafted with expertly brewed espresso and perfectly steamed milk. This classic favorite offers a smooth, creamy texture with a balanced coffee flavor, making it the perfect pick-me-up any time of the day.Enjoy it hot for a cozy, comforting experience or iced for a refreshing twist. Whether you’re starting your morning or taking a midday break, our Café Latte delivers the perfect blend of bold espresso and silky milk in every sip.☕ Rich Espresso | Creamy Steamed Milk | Perfectly Balanced.',
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
              subTitle:
                  'كافيه لاتيه – النعومة والكمال في كل رشفةاستمتع بالمذاق الغني والحريري لـ كافيه لاتيه، المصنوع من الإسبريسو المحضر بعناية والحليب المبخر بشكل مثالي. هذا المشروب الكلاسيكي يتميز بقوامه الكريمي ونكهته المتوازنة، مما يجعله الخيار المثالي لبدء يومك أو كاستراحة منعشة خلال اليوم.يمكنك الاستمتاع به ساخنًا لمنحك دفئًا وراحة، أو باردًا لإحساس منعش. في كل رشفة، يقدم لك كافيه لاتيه مزيجًا مثاليًا من الإسبريسو القوي والحليب الناعم.☕ إسبريسو غني | حليب مبخر كريمي | توازن مثالي للنكهة',
              isArabic: true,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: r'$24.1',
              iconData: IconlyLight.wallet,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: 'Cold / Hot',
              iconData: IconlyLight.info_square,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: '4.5 (50 Ratings)',
              iconData: IconlyBold.star,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: 'American, Coffee',
              iconData: IconlyLight.category,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
      ],
    );
  }
}
