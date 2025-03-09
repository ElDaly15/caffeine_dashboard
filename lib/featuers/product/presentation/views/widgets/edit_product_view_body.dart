import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/update_product/update_product_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProductViewBody extends StatefulWidget {
  const EditProductViewBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<EditProductViewBody> createState() => _EditProductViewBodyState();
}

class _EditProductViewBodyState extends State<EditProductViewBody> {
  final List<String> categoryItems = [
    'Cappuccino',
    'Latte',
    'Espresso',
    'Americano',
    'Macchiato',
  ];

  final List<String> infoItems = ['Hot', 'Cold', 'Hot/Cold'];
  String? selectedCategory,
      info,
      productNameEn,
      productNameAr,
      productDescriptionEn,
      productDescriptionAr,
      productCategory,
      productImage,
      productInfo,
      productPriceS,
      productPriceM,
      productPriceL,
      productCode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Product Name [En]',
              onChanged: (value) {
                productNameEn = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productNameEn,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Product Name [Ar]',
              onChanged: (value) {
                productNameAr = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productNameAr,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 5,

              title: 'Product Description [En]',
              onChanged: (value) {
                productDescriptionEn = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productDescriptionEn,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 5,

              title: 'Product Description [Ar]',
              onChanged: (value) {
                productDescriptionAr = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productDescriptionAr,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Product Price [S]',
              onChanged: (value) {
                productPriceS = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productPriceS,
              ),
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            CustomEditTextField(
              maxlines: 1,

              title: 'Product Price [M]',
              onChanged: (value) {
                productPriceM = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productPriceM,
              ),
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Product Price [L]',
              onChanged: (value) {
                productPriceL = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productPriceL,
              ),
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Product Code',
              onChanged: (value) {
                productCode = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productCode,
              ),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 2,

              title: 'Image Url',
              onChanged: (value) {
                productImage = value;
              },
              textEditingController: TextEditingController(
                text: widget.productModel.productImage,
              ),
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
              onPressed: () {
                BlocProvider.of<UpdateProductCubit>(context).updateProduct(
                  code: widget.productModel.productCode,
                  productNameAr:
                      productNameAr ?? widget.productModel.productNameAr,
                  productNameEn:
                      productNameEn ?? widget.productModel.productNameEn,
                  productDescriptionAr:
                      productDescriptionAr ??
                      widget.productModel.productDescriptionAr,
                  productDescriptionEn:
                      productDescriptionEn ??
                      widget.productModel.productDescriptionEn,
                  productCategory:
                      selectedCategory ?? widget.productModel.productCategory,
                  productImage:
                      productImage ?? widget.productModel.productImage,
                  productInfo: info ?? widget.productModel.productInfo,
                  productPriceS:
                      productPriceS ?? widget.productModel.productPriceS,
                  productPriceM:
                      productPriceM ?? widget.productModel.productPriceM,
                  productPriceL:
                      productPriceL ?? widget.productModel.productPriceL,
                  productCode: productCode ?? widget.productModel.productCode,
                );
              },
              title: 'Edit Product',
              iconData: FontAwesomeIcons.floppyDisk,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
