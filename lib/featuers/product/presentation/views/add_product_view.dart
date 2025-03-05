import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/add_product/add_product_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/search_code/search_product_code_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/add_prodcut_view_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

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
          'Add Product',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AddProductCubit()),
          BlocProvider(create: (context) => SearchProductCodeCubit()),
        ],
        child: const AddProdcutViewConsumer(),
      ),
    );
  }
}
