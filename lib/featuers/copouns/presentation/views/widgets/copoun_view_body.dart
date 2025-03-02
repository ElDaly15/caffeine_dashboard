import 'package:caffeine_dashboard/featuers/copouns/presentation/views/widgets/sliver_list_of_copouns.dart';
import 'package:flutter/material.dart';

class CopounViewBody extends StatelessWidget {
  const CopounViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverListOfCopouns(),
      ],
    );
  }
}
