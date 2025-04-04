import 'package:caffeine_dashboard/core/models/order_model.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/manager/get_order_by_id/get_order_by_id_cubit.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/order_details_view.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/main_order_item.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverListOfMainOrdersItems extends StatelessWidget {
  const SliverListOfMainOrdersItems({super.key, required this.orders});
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: MainOrderItem(
            orderModel: orders[index],
            itemCount: '${index + 1}',
            onTap: () {
              BlocProvider.of<GetUserDataCubit>(
                context,
              ).getUserData(uid: orders[index].userId);
              BlocProvider.of<GetOrderByIdCubit>(
                context,
              ).getProductByCode(code: orders[index].orderId);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const OrderDetailsView();
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
