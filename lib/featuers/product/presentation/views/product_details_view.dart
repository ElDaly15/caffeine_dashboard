import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/edit_product_view.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogOfDelete(
                    subTitle: 'product',
                    title: 'Delete Product',
                    onDelete: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              );
            },
            icon: Icon(IconlyLight.delete, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return EditProductView(productModel: productModel);
                  },
                ),
              );
            },
            icon: Icon(IconlyLight.edit, color: Colors.white),
          ),
        ],
        title: Text(
          'Product Details',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocBuilder<GetProductByCodeCubit, GetProductByCodeState>(
        builder: (context, state) {
          if (state is GetProductsByCodeSuccess) {
            return ProductDetailsViewBody(productModel: state.productModel);
          } else if (state is GetProductsByCodeFailuer) {
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
