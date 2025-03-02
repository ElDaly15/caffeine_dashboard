import 'package:caffeine_dashboard/featuers/ads/presentation/views/add_ads_view.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/views/ads_view.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/add_copoun_view.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/copoun_view.dart';
import 'package:caffeine_dashboard/featuers/home/data/models/dashboard_main_cotnainer_model.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/container_of_dashboard_item.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/add_notification_view.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/notification_view.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/orders_view.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/add_product_view.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/products_view.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/users_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

class GridOfDashboardItems extends StatefulWidget {
  const GridOfDashboardItems({super.key});

  @override
  State<GridOfDashboardItems> createState() => _GridOfDashboardItemsState();
}

class _GridOfDashboardItemsState extends State<GridOfDashboardItems> {
  final List<DashboardMainCotnainerModel> dashboardMainCotnainerModel = [
    DashboardMainCotnainerModel(
      title: 'Users',
      icon: IconlyBold.user_2,
      screen: UsersView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Orders',
      icon: IconlyBold.bag,
      screen: OrdersView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Products',
      icon: FontAwesomeIcons.barcode,
      screen: ProductsView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Add Product',
      icon: IconlyBold.plus,
      screen: AddProductView(),
    ),

    DashboardMainCotnainerModel(
      title: 'Ads',
      icon: FontAwesomeIcons.signHanging,
      screen: AdsView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Add Ads',
      icon: IconlyBold.plus,
      screen: AddAdsView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Notifications',
      icon: IconlyBold.notification,
      screen: NotificationView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Add Notification',
      icon: IconlyBold.plus,
      screen: AddNotificationView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Coupons',
      icon: IconlyBold.discount,
      screen: CopounView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Add Coupon',
      icon: IconlyBold.plus,
      screen: AddCopounView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 10,
        childAspectRatio: 1.35,
      ),
      itemCount: dashboardMainCotnainerModel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ContainerOfSelectionItemInDashboard(
            title: dashboardMainCotnainerModel[index].title,
            icon: dashboardMainCotnainerModel[index].icon,
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return dashboardMainCotnainerModel[index].screen;
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
