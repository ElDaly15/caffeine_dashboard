import 'package:caffeine_dashboard/core/models/cart_model.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/sub_order_item.dart';
import 'package:flutter/material.dart';

class SliverOfSubOrdersItem extends StatelessWidget {
  const SliverOfSubOrdersItem({super.key, required this.products});
  final List<CartModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: SubOrderItem(cartModel: products[index]),
        );
      },
    );
  }
}
