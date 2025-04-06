// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/manager/update_order_status/update_order_status_cubit.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/order_details_view_body.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/manager_user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return BlocConsumer<UpdateOrderStatusCubit, UpdateOrderStatusState>(
            listener: (context, updateStatus) {
              if (updateStatus is UpdateOrderStatusSuccess) {
                CustomSnackBar().showCustomSnackBar(
                  context: context,
                  message: 'Order Status Updated Successfully',
                  type: AnimatedSnackBarType.success,
                );
              }
              if (updateStatus is UpdateOrderStatusFailuer) {
                CustomSnackBar().showCustomSnackBar(
                  context: context,
                  message: 'Failed to Update Order Status',
                  type: AnimatedSnackBarType.error,
                );
              }

              if (updateStatus is SendAlertNotificationSuccess) {
                CustomSnackBar().showCustomSnackBar(
                  context: context,
                  message: 'Notification Sent Successfully',
                  type: AnimatedSnackBarType.success,
                );
              }
              if (updateStatus is SendAlertNotificationError) {
                CustomSnackBar().showCustomSnackBar(
                  context: context,
                  message: 'Failed to Send Notification',
                  type: AnimatedSnackBarType.error,
                );
              }
            },
            builder: (context, updateStatus) {
              return ModalProgressHUD(
                inAsyncCall:
                    updateStatus is UpdateOrderStatusLoading ||
                    updateStatus is SendAlertNotificationLoading,
                progressIndicator: const CircularProgressIndicator(
                  color: AppColors.mainColorTheme,
                ),
                color: Colors.white.withOpacity(0.5),
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ManagerUserView(user: state.userModel);
                              },
                            ),
                          );
                        },
                        icon: Icon(IconlyLight.user, color: Colors.white),
                      ),
                    ],
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
                    ),
                    title: Text(
                      'Order Details',
                      style: TextStyles.font20Regular(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    backgroundColor: AppColors.mainColorTheme,
                  ),
                  body: OrderDetailsViewBody(userModel: state.userModel),
                ),
              );
            },
          );
        } else if (state is GetUserDataLoading) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [],

              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
              ),
              title: Text(
                'Order Details',
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.mainColorTheme,
            ),
            body: Center(
              child: CircularProgressIndicator(color: AppColors.mainColorTheme),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
              actions: [],
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
              ),
              title: Text(
                'Order Details',
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.mainColorTheme,
            ),
            body: Center(
              child: Text(
                'An error occurred while fetching user data',
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            ),
          );
        }
      },
    );
  }
}
