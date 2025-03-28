// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/delete_branch/delete_branch_cubit.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/views/widgets/branches_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BranchesView extends StatelessWidget {
  const BranchesView({super.key});

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
          'Branches',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<DeleteBranchCubit, DeleteBranchState>(
        listener: (context, state) {
          if (state is DeleteBranchSuccess) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Branch Deleted Successfully',
              type: AnimatedSnackBarType.success,
            );
          }

          if (state is DeleteBranchFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Branch Delete Failuer',
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: Colors.white.withOpacity(0.5),
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            inAsyncCall: state is DeleteBranchLoading,
            child: BranchesViewBody(),
          );
        },
      ),
    );
  }
}
