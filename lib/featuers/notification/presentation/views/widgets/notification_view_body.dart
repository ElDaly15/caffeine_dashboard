import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/manager/get_notification_cubit/get_notifications_cubit.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/widgets/sliver_list_of_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
      builder: (context, state) {
        if (state is GetNotificationsSuccess) {
          if (state.notifications.isEmpty) {
            return Center(
              child: Text(
                'No Notifications Yet',
                style: TextStyles.font18Medium(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverListOfNotification(notifications: state.notifications),
              ],
            );
          }
        } else if (state is GetNotificationsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainColorTheme),
          );
        } else {
          return Center(
            child: Text(
              'An Error Occured Please Try Again',
              style: TextStyles.font18Medium(
                context,
              ).copyWith(color: AppColors.mainColorTheme),
            ),
          );
        }
      },
    );
  }
}
