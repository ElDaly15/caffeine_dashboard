import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/list_view_of_products.dart';
import 'package:flutter/material.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(children: [ListViewOfProducts(products: products)]),
    );
  }
}
