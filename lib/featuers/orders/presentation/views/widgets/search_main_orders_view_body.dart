import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/sliver_list_of_main_orders_item.dart';
import 'package:flutter/material.dart';

class SearchMainOrdersViewBody extends StatelessWidget {
  const SearchMainOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(
        slivers: [SliverListOfMainOrdersItems(orders: [])],
      ),
    );
  }
}
