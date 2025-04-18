// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/edit_branch/edit_branch_cubit.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/views/widgets/edit_branch_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditBranchView extends StatelessWidget {
  const EditBranchView({super.key, required this.branchModel});
  final BranchModel branchModel;

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
          'Edit Branch',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<EditBranchCubit, EditBranchState>(
        listener: (context, state) {
          if (state is EditBranchSuccess) {
            Navigator.pop(context);
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Branch Updated Successfully',
              type: AnimatedSnackBarType.success,
            );
          }

          if (state is EditBranchFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Branch Updated Failuer',
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
            inAsyncCall: state is EditBranchLoading,
            child: EditBranchViewBody(branchModel: branchModel),
          );
        },
      ),
    );
  }
}
