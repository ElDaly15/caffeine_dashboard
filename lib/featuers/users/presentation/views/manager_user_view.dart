// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/users/data/models/user_model.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/ban_user/ban_user_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/manager_user_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ManagerUserView extends StatelessWidget {
  const ManagerUserView({super.key, required this.user});
  final UserModel user;

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
          'Manage User',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<BanUserCubit, BanUserState>(
        listener: (context, state) {
          if (state is BanUserSuccess) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Ban User Successfully',
              type: AnimatedSnackBarType.success,
            );
          }
          if (state is BanUserFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: state.error,
              type: AnimatedSnackBarType.error,
            );
          }
          if (state is UnBanUserSuccess) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'UnBan User Successfully',
              type: AnimatedSnackBarType.success,
            );
          }
          if (state is UnBanUserFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'UnBan User Successfully',
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is BanUserLoading || state is UnBanUserLoading,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            color: Colors.white.withOpacity(0.5),
            child: const ManagerUserViewBody(),
          );
        },
      ),
    );
  }
}
