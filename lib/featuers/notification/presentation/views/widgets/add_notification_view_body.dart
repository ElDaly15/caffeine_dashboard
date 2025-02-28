import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddNotificationViewBody extends StatelessWidget {
  const AddNotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomEditTextField(
            title: 'Title',
            onChanged: (value) {},
            textEditingController: TextEditingController(),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          CustomEditTextField(
            title: 'Description',
            onChanged: (value) {},
            textEditingController: TextEditingController(),
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 20),
          CustomBigElevatedBtmWithIcon(
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'Add',
            iconData: FontAwesomeIcons.plus,
          ),
        ],
      ),
    );
  }
}
