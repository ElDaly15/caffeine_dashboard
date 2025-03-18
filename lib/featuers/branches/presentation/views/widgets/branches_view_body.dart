import 'package:caffeine_dashboard/featuers/branches/presentation/views/widgets/sliver_list_of_branches.dart';
import 'package:flutter/material.dart';

class BranchesViewBody extends StatelessWidget {
  const BranchesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverListOfBranches(),
      ],
    );
  }
}
