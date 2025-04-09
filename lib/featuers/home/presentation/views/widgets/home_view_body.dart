import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/start_view.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/custom_header_for_home.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/grid_of_dashboard_items.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.isMainAdmin});
  final bool isMainAdmin;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: AppColors.mainColorTheme,
            height: MediaQuery.of(context).size.height * 0.024,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomAppBarForHomePage(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const StartView()),
                (_) => false,
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        GridOfDashboardItems(isMainAdmin: isMainAdmin),
        SliverToBoxAdapter(child: SizedBox(height: 15)),
      ],
    );
  }
}
