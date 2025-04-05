// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/manager/manage_notification/manage_notification_cubit.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
        ),
        title: Text(
          'Notification',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<ManageNotificationCubit, ManageNotificationState>(
        listener: (context, state) {
          if (state is ManageNotificationDeleteSuccess) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Notification Deleted Successfully',
              type: AnimatedSnackBarType.success,
            );
          }
          if (state is ManageNotificationDeleteFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Notification Deleted Failuer',
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ManageNotificationDeleteLoading,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            color: Colors.white.withOpacity(0.5),
            child: const NotificationViewBody(),
          );
        },
      ),
    );
  }
}
