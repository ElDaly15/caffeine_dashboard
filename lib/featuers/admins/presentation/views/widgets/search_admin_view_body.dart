import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/manager/search_admins/search_admins_cubit.dart';
import 'package:caffeine_dashboard/featuers/admins/presentation/views/widgets/list_view_of_admin_items.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/search_user/search_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAdminViewBody extends StatelessWidget {
  const SearchAdminViewBody({super.key, required this.searchValue});
  final String searchValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: BlocBuilder<SearchAdminsCubit, SearchAdminsState>(
        builder: (context, state) {
          if (state is SearchAdminsSuccess) {
            if (state.admins.isEmpty || searchValue.isEmpty) {
              return searchValue.isNotEmpty
                  ? Center(
                    child: Text(
                      'No Result Found',
                      style: TextStyles.font18Medium(
                        context,
                      ).copyWith(color: AppColors.mainColorTheme),
                    ),
                  )
                  : Center(
                    child: Text(
                      'Start Searching  ',
                      style: TextStyles.font18Medium(
                        context,
                      ).copyWith(color: AppColors.mainColorTheme),
                    ),
                  );
            } else {
              return CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: [ListViewOfSearchAdminItems(admins: state.admins)],
              );
            }
          } else if (state is SearchAdminsFailuer) {
            return Center(
              child: Text(
                state.errorMsg,
                style: TextStyles.font20Regular(
                  context,
                ).copyWith(color: AppColors.mainColorTheme),
              ),
            );
          } else if (state is SearchUserLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.mainColorTheme),
            );
          } else {
            return Center(
              child: Text(
                'Start Searching',
                style: TextStyles.font18Medium(
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
