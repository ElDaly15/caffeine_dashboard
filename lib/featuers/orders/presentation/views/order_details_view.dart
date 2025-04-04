import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/orders/presentation/views/widgets/order_details_view_body.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/manager_user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Scaffold(
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
            body: const OrderDetailsViewBody(),
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
