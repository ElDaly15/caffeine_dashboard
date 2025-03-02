import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/manage_order_container.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/sliver_of_sub_orders_item.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/container_of_user_info.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({super.key});

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: Text('Order Info', style: TextStyles.font20Medium(context)),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: '23XEP3213XS2313',
              iconData: Icons.qr_code,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: r'500 EGP',
              iconData: IconlyLight.wallet,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: '20/10/2022 - 10:00 AM',
              iconData: IconlyLight.time_circle,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: 'PickUp - [Maadi Branch]',
              iconData: IconlyLight.location,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomCotnainerOfUserInfo(
              title: 'Out For Delivery',
              iconData: IconlyLight.info_circle,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Order Details',
              style: TextStyles.font20Medium(context),
            ),
          ),
        ),
        SliverOfSubOrdersItem(),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Manage Order Status',
              style: TextStyles.font20Medium(context),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ManageOrderContainer(
                    isActive: index == 0,
                    title: 'Pending',
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ManageOrderContainer(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    isActive: index == 1,
                    title: 'Out For Delivery',
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ManageOrderContainer(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    isActive: index == 2,
                    title: 'Delivered',
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ManageOrderContainer(
                    onTap: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    isActive: index == 3,
                    title: 'Cancelled',
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}
