import 'package:caffeine_dashboard/featuers/notification/data/models/notification_model.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/manager/manage_notification/manage_notification_cubit.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/edit_notification_view.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/widgets/container_of_notificaiton_item.dart';
import 'package:caffeine_dashboard/core/widgets/dialogs/dialog_of_delete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverListOfNotification extends StatelessWidget {
  const SliverListOfNotification({super.key, required this.notifications});
  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: ContainerOfNotificationItem(
            notificationModel: notifications[index],
            onDelete: () {
              showDialog(
                context: context,
                builder:
                    (context) => DialogOfDelete(
                      onDelete: () {
                        Navigator.pop(context);
                        BlocProvider.of<ManageNotificationCubit>(
                          context,
                        ).deleteNotification(
                          notification: notifications[index],
                        );
                      },
                      title: 'Delete Notification',
                      subTitle: 'notification',
                    ),
              );
            },
            onEdit: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => EditNotificationView(
                        notificationModel: notifications[index],
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
