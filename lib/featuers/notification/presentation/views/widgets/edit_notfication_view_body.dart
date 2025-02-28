import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditNotficationViewBody extends StatefulWidget {
  const EditNotficationViewBody({super.key});

  @override
  State<EditNotficationViewBody> createState() =>
      _EditNotficationViewBodyState();
}

class _EditNotficationViewBodyState extends State<EditNotficationViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('Edit Title', style: TextStyles.font20SemiBold(context)),
          CustomEditTextField(
            title: 'Title',
            onChanged: (value) {},
            textEditingController: TextEditingController(text: 'Sale On Latte'),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Text('Edit Description', style: TextStyles.font20SemiBold(context)),
          CustomEditTextField(
            title: 'Description',
            onChanged: (value) {},
            textEditingController: TextEditingController(
              text:
                  'New Sale For Caffe Latte , Now In Maadi , Heilioples go to get it now',
            ),
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          CustomBigElevatedBtmWithIcon(
            onPressed: () {},
            title: 'Save',
            iconData: FontAwesomeIcons.floppyDisk,
          ),
        ],
      ),
    );
  }
}
