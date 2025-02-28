import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/list_view_of_products.dart';
import 'package:flutter/material.dart';

class SearchProductsViewBody extends StatelessWidget {
  const SearchProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(children: [ListViewOfProducts()]),
    );
  }
}
