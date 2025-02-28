import 'package:caffeine_dashboard/featuers/product/presentation/views/product_details_view.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ListViewOfProducts extends StatelessWidget {
  const ListViewOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ProductItem(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProductDetailsView(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
