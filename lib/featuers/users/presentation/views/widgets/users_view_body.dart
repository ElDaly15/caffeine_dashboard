import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/get_users/get_users_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/list_view_of_users_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: BlocBuilder<GetUsersCubit, GetUsersState>(
        builder: (context, state) {
          if (state is GetUsersSuccess) {
            if (state.users.isEmpty) {
              return Center(
                child: Text(
                  'No users found',
                  style: TextStyles.font20Regular(
                    context,
                  ).copyWith(color: AppColors.mainColorTheme),
                ),
              );
            } else {
              return CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: [ListViewOfUsersItems(users: state.users)],
              );
            }
          } else if (state is GetUsersLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.mainColorTheme),
            );
          } else {
            return Center(
              child: Text(
                'An error occurred, please try again',
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          }
        },
      ),
    );
  }
}
