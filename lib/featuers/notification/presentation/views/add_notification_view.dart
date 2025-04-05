// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/manager/send_notification_to_all_users/send_notification_to_all_users_cubit.dart';
import 'package:caffeine_dashboard/featuers/notification/presentation/views/widgets/add_notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNotificationView extends StatelessWidget {
  const AddNotificationView({super.key});

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
      body: BlocConsumer<
        SendNotificationToAllUsersCubit,
        SendNotificationToAllUsersState
      >(
        listener: (context, state) {
          if (state is SendNotificationToAllUsersSuccess) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Notification Sent Successfully',
              type: AnimatedSnackBarType.success,
            );
          }
          if (state is SendNotificationToAllUsersError) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: state.errorMessage,
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SendNotificationToAllUsersLoading,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            color: Colors.white.withOpacity(0.5),
            child: const AddNotificationViewBody(),
          );
        },
      ),
    );
  }
}
