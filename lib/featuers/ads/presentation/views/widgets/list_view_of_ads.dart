import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/views/edit_ads_view.dart';
import 'package:caffeine_dashboard/featuers/ads/presentation/views/widgets/custom_ads_item.dart';
import 'package:flutter/material.dart';

class ListViewOfAds extends StatelessWidget {
  const ListViewOfAds({super.key});

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
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogOfDelete(
                        onDelete: () {
                          Navigator.pop(context);
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
                      builder: (context) => const EditAdsView(),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
