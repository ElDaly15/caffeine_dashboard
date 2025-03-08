import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/update_product/update_product_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/edit_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key, required this.productModel});
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
        title: Text(
          'Edit Product',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocBuilder<GetProductByCodeCubit, GetProductByCodeState>(
        builder: (context, state) {
          if (state is GetProductsByCodeSuccess) {
            return BlocConsumer<UpdateProductCubit, UpdateProductState>(
              listener: (context, updateState) {
                if (updateState is UpdateProductSuccess) {
                  Navigator.pop(context);
                  CustomSnackBar().showCustomSnackBar(
                    context: context,
                    message: 'Product Updated Successfully',
                    type: AnimatedSnackBarType.success,
                  );
                }
                if (updateState is UpdateProductFailuer) {
                  CustomSnackBar().showCustomSnackBar(
                    context: context,
                    message: 'An Error Occured , Try Again',
                    type: AnimatedSnackBarType.error,
                  );
                }
              },
              builder: (context, updateState) {
                return ModalProgressHUD(
                  inAsyncCall: updateState is UpdateProductLoading,
                  color: Colors.transparent,
                  progressIndicator: CircularProgressIndicator(
                    color: AppColors.mainColorTheme,
                  ),
                  child: EditProductViewBody(productModel: state.productModel),
                );
              },
            );
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
