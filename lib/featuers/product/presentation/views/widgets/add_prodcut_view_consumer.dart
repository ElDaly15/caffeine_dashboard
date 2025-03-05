import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/add_product/add_product_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProdcutViewConsumer extends StatelessWidget {
  const AddProdcutViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          Navigator.pop(context);
          CustomSnackBar().showCustomSnackBar(
            context: context,
            message: 'Product Added Successfully',
            type: AnimatedSnackBarType.success,
          );
        }
        if (state is AddProductFailuer) {
          CustomSnackBar().showCustomSnackBar(
            context: context,
            message: state.failuer.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.mainColorTheme,
          ),
          color: Colors.transparent,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
