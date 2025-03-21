import 'package:caffeine_dashboard/featuers/notification/presentation/views/widgets/sliver_list_of_notification.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverListOfNotification(),
      ],
    );
  }
}
