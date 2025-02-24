import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/custom_cotaniner_of_user_item.dart';
import 'package:flutter/material.dart';

class ListViewOfUsersItems extends StatelessWidget {
  const ListViewOfUsersItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: CustomContainerOfUserItem(onTap: () {}),
        );
      },
    );
  }
}
