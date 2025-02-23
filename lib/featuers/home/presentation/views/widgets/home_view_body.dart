import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/custom_header_for_home.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/grid_of_dashboard_items.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: AppColors.mainColorTheme,
            height: MediaQuery.of(context).size.height * 0.024,
          ),
        ),
        SliverToBoxAdapter(child: CustomAppBarForHomePage()),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        GridOfDashboardItems(),
        SliverToBoxAdapter(child: SizedBox(height: 15)),
      ],
    );
  }
}
