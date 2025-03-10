import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/ads/data/models/ads_model.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/add_ads/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

class AddAdsViewBody extends StatefulWidget {
  const AddAdsViewBody({super.key});

  @override
  State<AddAdsViewBody> createState() => _AddAdsViewBodyState();
}

class _AddAdsViewBodyState extends State<AddAdsViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, url;
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
              onChanged: (value) {
                title = value;
              },
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomEditTextField(
              maxlines: 1,

              title: 'Link Url',
              onChanged: (value) {
                url = value;
              },
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomBigElevatedBtmWithIcon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var uuid = Uuid();
                  AdsModel adsModel = AdsModel(
                    title: title!,
                    url: url!,
                    id: uuid.v4(),
                  );
                  BlocProvider.of<AddAdsCubit>(context).addAds(adsModel);
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
