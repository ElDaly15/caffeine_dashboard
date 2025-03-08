import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddAdsViewBody extends StatefulWidget {
  const AddAdsViewBody({super.key});

  @override
  State<AddAdsViewBody> createState() => _AddAdsViewBodyState();
}

class _AddAdsViewBodyState extends State<AddAdsViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,
              title: 'Title',
              onChanged: (value) {},
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Link Url',
              onChanged: (value) {},
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomBigElevatedBtmWithIcon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              title: 'Add',
              iconData: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ),
    );
  }
}
