import 'package:caffeine_dashboard/featuers/ads/presentation/views/widgets/custom_ads_item.dart';
import 'package:flutter/material.dart';

class ListViewOfAds extends StatelessWidget {
  const ListViewOfAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: CustomAdsItem(onDelete: () {}, onEdit: () {}),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
