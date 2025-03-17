import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/delete_copoun/delete_copoun_cubit.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/widgets/copoun_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CopounView extends StatelessWidget {
  const CopounView({super.key});

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
          'Copouns',
          style: TextStyles.font20Regular(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      body: BlocConsumer<DeleteCopounCubit, DeleteCopounState>(
        listener: (context, state) {
          if (state is DeleteCopounSuccess) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Copoun Deleted Successfully',
              type: AnimatedSnackBarType.success,
            );
          }

          if (state is DeleteCopounFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'Copoun Deleted Failuer',
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is DeleteCopounLoading,
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.5),
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.mainColorTheme,
            ),
            child: const CopounViewBody(),
          );
        },
      ),
    );
  }
}
