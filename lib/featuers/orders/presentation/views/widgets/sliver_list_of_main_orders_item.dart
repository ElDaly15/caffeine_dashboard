import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/main_order_item.dart';
import 'package:flutter/material.dart';

class SliverListOfMainOrdersItems extends StatelessWidget {
  const SliverListOfMainOrdersItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: MainOrderItem(itemCount: '${index + 1}', onTap: () {}),
        );
      },
    );
  }
}
