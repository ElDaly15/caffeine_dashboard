import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/list_view_of_users_item.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(slivers: [ListViewOfUsersItems()]),
    );
  }
}
