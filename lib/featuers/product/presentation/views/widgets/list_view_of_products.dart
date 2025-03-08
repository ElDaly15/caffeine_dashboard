import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/product_details_view.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewOfProducts extends StatelessWidget {
  const ListViewOfProducts({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ProductItem(
              productModel: products[index],
              onTap: () {
                BlocProvider.of<GetProductByCodeCubit>(
                  context,
                ).getProductByCode(code: products[index].productCode);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            ProductDetailsView(productModel: products[index]),
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
