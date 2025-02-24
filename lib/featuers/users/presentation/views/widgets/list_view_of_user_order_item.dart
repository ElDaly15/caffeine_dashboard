import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/usesr_order_item.dart';
import 'package:flutter/material.dart';

class ListViewOfUserOrderItem extends StatelessWidget {
  const ListViewOfUserOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: OrderItem(),
          );
        },
      ),
    );
  }
}
