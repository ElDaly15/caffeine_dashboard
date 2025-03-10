import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/big_elevated_btm_with_icon.dart';
import 'package:caffeine_dashboard/core/widgets/fields/custom_edit_text_field.dart';
import 'package:caffeine_dashboard/featuers/ads/data/models/ads_model.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/get_ad_by_id/get_ad_by_id_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/update_ads/update_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditAdsViewBody extends StatefulWidget {
  const EditAdsViewBody({super.key, required this.adsModel});
  final AdsModel adsModel;

  @override
  State<EditAdsViewBody> createState() => _EditAdsViewBodyState();
}

class _EditAdsViewBodyState extends State<EditAdsViewBody> {
  String? title, url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: BlocBuilder<GetAdByIdCubit, GetAdByIdState>(
        builder: (context, state) {
          if (state is GetAdByIdSuccess) {
            return Column(
              children: [
                const SizedBox(height: 20),
                CustomEditTextField(
                  maxlines: 1,

                  title: 'Title',
                  onChanged: (value) {
                    title = value;
                  },
                  textEditingController: TextEditingController(
                    text: state.adsModel.title,
                  ),
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                CustomEditTextField(
                  maxlines: 1,

                  title: 'Link Url',
                  onChanged: (value) {
                    url = value;
                  },
                  textEditingController: TextEditingController(
                    text: state.adsModel.url,
                  ),
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 20),
                CustomBigElevatedBtmWithIcon(
                  onPressed: () {
                    BlocProvider.of<UpdateAdsCubit>(context).updateAds(
                      id: state.adsModel.id,
                      title: title ?? state.adsModel.title,
                      url: url ?? state.adsModel.url,
                    );
                  },
                  title: 'Save',
                  iconData: FontAwesomeIcons.floppyDisk,
                ),
              ],
            );
          } else if (state is GetAdByIdFailuer) {
            return Center(
              child: Text(
                state.error,
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.mainColorTheme),
            );
          }
        },
      ),
    );
  }
}
