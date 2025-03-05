// ignore_for_file: use_build_context_synchronously

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/add_product/add_product_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/search_code/search_product_code_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final List<String> categoryItems = [
    'Cappuccino',
    'Latte',
    'Espresso',
    'Americano',
    'Macchiato',
  ];

  final List<String> infoItems = ['Hot', 'Cold', 'Hot/Cold'];
  String? productNameAr,
      productNameEn,
      productDescriptionAr,
      productDescriptionEn,
      productPrice,
      productCode,
      productImage;

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? selectedCategory, info;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Name [En]',
                onChanged: (value) {
                  productNameEn = value;
                },
                textEditingController: TextEditingController(),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Name [Ar]',
                onChanged: (value) {
                  productNameAr = value;
                },
                textEditingController: TextEditingController(),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Description [En]',
                onChanged: (value) {
                  productDescriptionEn = value;
                },
                textEditingController: TextEditingController(),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Description [Ar]',
                onChanged: (value) {
                  productDescriptionAr = value;
                },
                textEditingController: TextEditingController(),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Price',
                onChanged: (value) {
                  productPrice = value;
                },
                textEditingController: TextEditingController(),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Code',
                onChanged: (value) {
                  productCode = value;
                },
                textEditingController: TextEditingController(),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Image Url',
                onChanged: (value) {
                  productImage = value;
                },
                textEditingController: TextEditingController(),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Category',
                        style: TextStyles.font18SemiBold(context),
                      ),
                      const SizedBox(height: 4),
                      CustomDropMenu(
                        items: categoryItems,
                        title: 'Category',
                        onChanged: (value) {
                          selectedCategory = value;
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Info',
                        style: TextStyles.font18SemiBold(context),
                      ),
                      const SizedBox(height: 4),
                      CustomDropMenu(
                        items: infoItems,
                        title: 'Info',
                        onChanged: (value) {
                          info = value;
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomBigElevatedBtmWithIcon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (selectedCategory == null && info == null) {
                      CustomSnackBar().showCustomSnackBar(
                        context: context,
                        message: 'Please select category and info',
                        type: AnimatedSnackBarType.error,
                      );
                    }

                    if (selectedCategory == null && info != null) {
                      CustomSnackBar().showCustomSnackBar(
                        context: context,
                        message: 'Please select category',
                        type: AnimatedSnackBarType.error,
                      );
                    }

                    if (selectedCategory != null && info == null) {
                      CustomSnackBar().showCustomSnackBar(
                        context: context,
                        message: 'Please select info',
                        type: AnimatedSnackBarType.error,
                      );
                    }

                    if (selectedCategory != null && info != null) {
                      var result =
                          await BlocProvider.of<SearchProductCodeCubit>(
                            context,
                          ).searchProductCode(productCode!);

                      if (result) {
                        CustomSnackBar().showCustomSnackBar(
                          context: context,
                          message: 'Product Code Already Exists',
                          type: AnimatedSnackBarType.error,
                        );
                        return;
                      }
                      ProductModel productModelForAddProduct = ProductModel(
                        productNameEn: productNameEn!,
                        productNameAr: productNameAr!,
                        productDescriptionEn: productDescriptionEn!,
                        productDescriptionAr: productDescriptionAr!,
                        productPrice: productPrice!,
                        productCode: productCode!,
                        productImage: productImage!,
                        productCategory: selectedCategory!,
                        productInfo: info!,
                        favIds: [],
                        rating: 0,
                        ratingCount: 0,
                        ratingUserModel: [],
                      );
                      await BlocProvider.of<AddProductCubit>(
                        context,
                      ).addProduct(productModelForAddProduct);
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                title: 'Add Product',
                iconData: FontAwesomeIcons.plus,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
