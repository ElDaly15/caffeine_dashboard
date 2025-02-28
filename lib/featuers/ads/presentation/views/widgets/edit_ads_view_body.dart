import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditAdsViewBody extends StatelessWidget {
  const EditAdsViewBody({super.key});

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
            textEditingController: TextEditingController(text: 'Sale Ads #01'),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          CustomEditTextField(
            title: 'Link Url',
            onChanged: (value) {},
            textEditingController: TextEditingController(
              text: 'https://google.com',
            ),
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 20),
          CustomBigElevatedBtmWithIcon(
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'Save',
            iconData: FontAwesomeIcons.floppyDisk,
          ),
        ],
      ),
    );
  }
}
