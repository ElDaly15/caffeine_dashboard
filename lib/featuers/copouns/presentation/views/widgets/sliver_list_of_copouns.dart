import 'package:caffeine_dashboard/featuers/copouns/presentation/views/widgets/main_copoun_container.dart';
import 'package:flutter/material.dart';

class SliverListOfCopouns extends StatelessWidget {
  const SliverListOfCopouns({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: MainCopounContainer(onTapDelete: () {}, onTapEdit: () {}),
        );
      },
    );
  }
}
