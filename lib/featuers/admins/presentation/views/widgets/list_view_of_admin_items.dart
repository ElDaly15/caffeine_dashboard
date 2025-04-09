import 'package:caffeine_dashboard/featuers/admins/data/models/admin_model.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/views/widgets/admin_item.dart';
import 'package:flutter/material.dart';

class ListViewOfAdminItems extends StatelessWidget {
  const ListViewOfAdminItems({super.key, required this.admins});
  final List<AdminModel> admins;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        itemCount: admins.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: AdminItem(adminModel: admins[index]),
          );
        },
      ),
    );
  }
}

class ListViewOfSearchAdminItems extends StatelessWidget {
  const ListViewOfSearchAdminItems({super.key, required this.admins});
  final List<AdminModel> admins;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: admins.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: AdminItem(adminModel: admins[index]),
        );
      },
    );
  }
}
