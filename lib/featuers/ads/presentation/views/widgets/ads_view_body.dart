import 'package:caffeine_dashboard/featuers/ads/presentation/views/widgets/list_view_of_ads.dart';
import 'package:flutter/material.dart';

class AdsViewBody extends StatelessWidget {
  const AdsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [ListViewOfAds()]),
    );
  }
}
