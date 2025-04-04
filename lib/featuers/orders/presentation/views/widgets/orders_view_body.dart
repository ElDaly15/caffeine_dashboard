import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/manager/get_orders/get_orders_cubit.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/sliver_list_of_main_orders_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
        builder: (context, state) {
          if (state is GetOrdersSuccess) {
            if (state.orders.isNotEmpty) {
              return CustomScrollView(
                slivers: [SliverListOfMainOrdersItems(orders: state.orders)],
              );
            } else {
              return Center(
                child: Text(
                  'No Orders Found',
                  style: TextStyles.font20Regular(
                    context,
                  ).copyWith(color: AppColors.mainColorTheme),
                ),
              );
            }
          } else if (state is GetOrdersLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.mainColorTheme),
            );
          } else {
            return Center(
              child: Text(
                'An error occurred while fetching orders',
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          }
        },
      ),
    );
  }
}
