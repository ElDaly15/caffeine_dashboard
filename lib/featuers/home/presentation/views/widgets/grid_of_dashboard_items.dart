import 'package:caffeine_dashboard/featuers/home/data/models/dashboard_main_cotnainer_model.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/home_view.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/container_of_dashboard_item.dart';
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
      screen: HomeView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Orders',
      icon: IconlyBold.bag,
      screen: HomeView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Products',
      icon: FontAwesomeIcons.barcode,
      screen: HomeView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Add Product',
      icon: IconlyBold.plus,
      screen: HomeView(),
    ),

    DashboardMainCotnainerModel(
      title: 'Ads',
      icon: FontAwesomeIcons.signHanging,
      screen: HomeView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Add Ads',
      icon: IconlyBold.plus,
      screen: HomeView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Notifications',
      icon: IconlyBold.notification,
      screen: HomeView(),
    ),
    DashboardMainCotnainerModel(
      title: 'Add Notification',
      icon: IconlyBold.plus,
      screen: HomeView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SliverGrid.builder(
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
      ),
    );
  }
}
