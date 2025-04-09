import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/manager/get_admins/get_admins_cubit.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/views/widgets/list_view_of_admin_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminViewBody extends StatelessWidget {
  const AdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAdminsCubit, GetAdminsState>(
      builder: (context, state) {
        if (state is GetAdminsSuccess) {
          if (state.admins.isEmpty) {
            return Center(
              child: Text(
                'No Admins Found',
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          } else {
            return ListViewOfAdminItems(admins: state.admins);
          }
        } else if (state is GetAdminsFailuer) {
          return Center(
            child: Text(
              state.errorMsg,
              style: TextStyles.font20Regular(
                context,
              ).copyWith(color: AppColors.mainColorTheme),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainColorTheme),
          );
        }
      },
    );
  }
}
