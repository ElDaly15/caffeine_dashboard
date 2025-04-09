import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine_dashboard/core/widgets/buttoms/custom_snack_bar.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/manager/check_user_login/check_user_login_cubit.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/home_view.dart';
import 'package:caffeine_dashboard/featuers/home/presentation/views/widgets/start_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<CheckUserLoginCubit, CheckUserLoginState>(
        listener: (context, state) {
          if (state is CheckUserLoginSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeView(isMainAdmin: state.isMainAdmin),
              ),
            );
          }
          if (state is CheckUserLoginFailuer) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: state.errorMsg,
              type: AnimatedSnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return CustomStartViewBdoy();
        },
      ),
    );
  }
}
