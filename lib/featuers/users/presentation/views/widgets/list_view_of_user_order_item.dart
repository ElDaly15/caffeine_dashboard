import 'package:caffeine_dashboard/core/models/order_model.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/usesr_order_item.dart';
import 'package:flutter/material.dart';

class ListViewOfUserOrderItem extends StatelessWidget {
  const ListViewOfUserOrderItem({super.key, required this.orders});
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: OrderItem(orderModel: orders[index]),
        );
      },
    );
  }
}
