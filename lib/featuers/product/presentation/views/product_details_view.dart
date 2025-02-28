import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/edit_product_view.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

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
                    return const EditProductView();
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
      body: const ProductDetailsViewBody(),
    );
  }
}
