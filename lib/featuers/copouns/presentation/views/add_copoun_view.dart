import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/manage_copouns/manage_copouns_cubit.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/widgets/add_copoun_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddCopounView extends StatelessWidget {
  const AddCopounView({super.key});

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
          'Add Copoun',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<ManageCopounsCubit, ManageCopounsState>(
        listener: (context, state) {
          if (state is ManageCopounsAddSuccess) {
            Navigator.pop(context);
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Copoun Added Successfully',
              type: AnimatedSnackBarType.success,
            );
          }

          if (state is ManageCopounsAddFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Copoun Add Failuer',
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ManageCopounsAddLoading,
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.5),
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            child: const AddCopounViewBody(),
          );
        },
      ),
    );
  }
}
