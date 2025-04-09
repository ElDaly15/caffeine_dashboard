// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/manager/add_admin/add_admin_cubit.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/views/widgets/add_admin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddAdminView extends StatelessWidget {
  const AddAdminView({super.key});

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
          'Add Admin',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<AddAdminCubit, AddAdminState>(
        listener: (context, state) {
          if (state is AddAdminSuccess) {
            Navigator.pop(context);
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Admin Added Successfully',
              type: AnimatedSnackBarType.success,
            );
          }
          if (state is AddAdminFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: state.failuer.message,
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddAdminLoading,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            color: Colors.white.withOpacity(0.5),
            child: const AddAdminViewBody(),
          );
        },
      ),
    );
  }
}
