import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/custom_cotaniner_of_user_item.dart';
import 'package:flutter/material.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: CustomContainerOfUserItem(onTap: () {})),
        ],
      ),
    );
  }
}
