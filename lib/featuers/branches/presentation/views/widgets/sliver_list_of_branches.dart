import 'package:caffeine_dashboard/featuers/branches/presentation/views/widgets/branch_item.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/edit_notification_view.dart';
import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:flutter/material.dart';

class SliverListOfBranches extends StatelessWidget {
  const SliverListOfBranches({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: BranchItem(
            onDelete: () {
              showDialog(
                context: context,
                builder:
                    (context) => DialogOfDelete(
                      onDelete: () {
                        Navigator.pop(context);
                      },
                      title: 'Delete Branch',
                      subTitle: 'branch',
                    ),
              );
            },
            onEdit: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EditNotificationView(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
