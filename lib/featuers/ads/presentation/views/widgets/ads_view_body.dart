import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/get_ads/get_ads_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/views/widgets/list_view_of_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsViewBody extends StatelessWidget {
  const AdsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: BlocBuilder<GetAdsCubit, GetAdsState>(
        builder: (context, state) {
          if (state is GetAdsSuccess) {
            return Column(children: [ListViewOfAds(ads: state.ads)]);
          } else if (state is GetAdsFailuer) {
            return Center(
              child: Text(
                state.errorMsg,
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainColorTheme),
          );
        },
      ),
    );
  }
}
