import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/get_products/get_products_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/search_product_view.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchProductView();
                  },
                ),
              );
            },
            icon: Icon(IconlyLight.search, color: Colors.white),
          ),
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
        ),
        title: Text(
          'Products',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsSuccess) {
            return ProductsViewBody(products: state.products);
          } else if (state is GetProductsFailuer) {
            return Center(
              child: Text(
                state.error,
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.mainColorTheme),
            );
          }
        },
      ),
    );
  }
}
