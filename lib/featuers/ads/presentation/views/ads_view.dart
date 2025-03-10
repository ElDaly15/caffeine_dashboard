import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/delete_ads/delete_ads_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/views/widgets/ads_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

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
          'Ads',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<DeleteAdsCubit, DeleteAdsState>(
        listener: (context, state) {
          if (state is DeleteAdsSuccess) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Ads Deleted Successfully',
              type: AnimatedSnackBarType.success,
            );
          }

          if (state is DeleteAdsFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Ads Deleted Failuer',
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
            inAsyncCall: state is DeleteAdsLoading,
            child: const AdsViewBody(),
          );
        },
      ),
    );
  }
}
