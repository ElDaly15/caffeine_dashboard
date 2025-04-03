import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/manager/search_user/search_user_cubit.dart';
import 'package:caffeine_dashboard/featuers/users/presentation/views/widgets/list_view_of_users_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.searchValue});
  final String searchValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: BlocBuilder<SearchUserCubit, SearchUserState>(
        builder: (context, state) {
          if (state is SearchUserSuccess) {
            if (state.users.isEmpty || searchValue.isEmpty) {
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
                slivers: [ListViewOfUsersItems(users: state.users)],
              );
            }
          } else if (state is SearchUserFailuer) {
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
