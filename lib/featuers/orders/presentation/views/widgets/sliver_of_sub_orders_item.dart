import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/sub_order_item.dart';
import 'package:flutter/material.dart';

class SliverOfSubOrdersItem extends StatelessWidget {
  const SliverOfSubOrdersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: SubOrderItem(),
        );
      },
    );
  }
}
