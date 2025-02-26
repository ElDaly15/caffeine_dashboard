import 'package:caffeine_dashboard/featuers/notification/presentation/views/edit_notification_view.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/widgets/container_of_notificaiton_item.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/widgets/dialog_of_delete.dart';
import 'package:flutter/material.dart';

class SliverListOfNotification extends StatelessWidget {
  const SliverListOfNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ContainerOfNotificationItem(
            onDelete: () {
              showDialog(
                context: context,
                builder:
                    (context) => DialogOfDelete(title: 'Delete Notification'),
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
