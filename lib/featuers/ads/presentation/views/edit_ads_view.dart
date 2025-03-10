import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/ads/data/models/ads_model.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/get_ad_by_id/get_ad_by_id_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/update_ads/update_ads_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/views/widgets/edit_ads_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditAdsView extends StatefulWidget {
  const EditAdsView({super.key, required this.adsModel});
  final AdsModel adsModel;

  @override
  State<EditAdsView> createState() => _EditAdsViewState();
}

class _EditAdsViewState extends State<EditAdsView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAdByIdCubit>(context).getAdById(id: widget.adsModel.id);
  }

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
          'Edit Ads',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<UpdateAdsCubit, UpdateAdsState>(
        listener: (context, state) {
          if (state is UpdateAdsSuccess) {
            Navigator.pop(context);
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Ads Updated Successfully',
              type: AnimatedSnackBarType.success,
            );
          }

          if (state is UpdateAdsFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Ads Updated Failuer',
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: Colors.transparent,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            inAsyncCall: state is UpdateAdsLoading,
            child: EditAdsViewBody(adsModel: widget.adsModel),
          );
        },
      ),
    );
  }
}
