// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/notification/data/models/notification_model.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/manager/manage_notification/manage_notification_cubit.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/widgets/edit_notfication_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditNotificationView extends StatelessWidget {
  const EditNotificationView({super.key, required this.notificationModel});
  final NotificationModel notificationModel;

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
          'Edit Notification',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<ManageNotificationCubit, ManageNotificationState>(
        listener: (context, state) {
          if (state is ManageNotificationUpdateSuccess) {
            Navigator.pop(context);
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Notification Updated Successfully',
              type: AnimatedSnackBarType.success,
            );
          }
          if (state is ManageNotificationUpdateFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Notification Updated Failuer',
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ManageNotificationUpdateLoading,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            color: Colors.white.withOpacity(0.5),
            child: EditNotficationViewBody(
              notificationModel: notificationModel,
            ),
          );
        },
      ),
    );
  }
}
