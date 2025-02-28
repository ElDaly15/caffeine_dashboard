import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/custom_drop_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProductViewBody extends StatefulWidget {
  const EditProductViewBody({super.key});

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
  final _formKey = GlobalKey<FormState>();
  String? selectedCategory, info;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                onChanged: (value) {},
                textEditingController: TextEditingController(text: '1'),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Name [Ar]',
                onChanged: (value) {},
                textEditingController: TextEditingController(text: '1'),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Description [En]',
                onChanged: (value) {},
                textEditingController: TextEditingController(text: '1'),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Description [Ar]',
                onChanged: (value) {},
                textEditingController: TextEditingController(text: '1'),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Price',
                onChanged: (value) {},
                textEditingController: TextEditingController(text: '1'),
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Product Code',
                onChanged: (value) {},
                textEditingController: TextEditingController(text: '1'),
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                title: 'Image Url',
                onChanged: (value) {},
                textEditingController: TextEditingController(text: '1'),
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
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    _formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: 'Edit Product',
                iconData: FontAwesomeIcons.floppyDisk,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
