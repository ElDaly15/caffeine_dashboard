import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:caffeine_dashboard/featuers/ads/data/models/ads_model.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/manager/delete_ads/delete_ads_cubit.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/views/edit_ads_view.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/views/widgets/custom_ads_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewOfAds extends StatelessWidget {
  const ListViewOfAds({super.key, required this.ads});

  final List<AdsModel> ads;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              child: CustomAdsItem(
                adsModel: ads[index],
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogOfDelete(
                        onDelete: () {
                          Navigator.pop(context);
                          BlocProvider.of<DeleteAdsCubit>(
                            context,
                          ).deleteAd(id: ads[index].id);
                        },
                        title: ' Delete Ads',
                        subTitle: 'ads',
                      );
                    },
                  );
                },
                onEdit: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditAdsView(adsModel: ads[index]),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: ads.length,
        ),
      ),
    );
  }
}
