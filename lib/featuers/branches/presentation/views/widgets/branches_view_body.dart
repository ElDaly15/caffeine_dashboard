import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/manager/get_branches/get_branches_cubit.dart';
import 'package:caffeine_dashboard/featuers/branches/presentation/views/widgets/sliver_list_of_branches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchesViewBody extends StatelessWidget {
  const BranchesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        BlocBuilder<GetBranchesCubit, GetBranchesState>(
          builder: (context, state) {
            if (state is GetBranchesSuccess) {
              if (state.branches.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      'No branches found',
                      style: TextStyles.font20Regular(
                        context,
                      ).copyWith(color: AppColors.mainColorTheme),
                    ),
                  ),
                );
              } else {
                return SliverListOfBranches(branches: state.branches);
              }
            } else if (state is GetBranchesFailuer) {
              return SliverFillRemaining(
                child: Center(
                  child: Text(
                    state.errorMsg,
                    style: TextStyles.font20Regular(
                      context,
                    ).copyWith(color: AppColors.mainColorTheme),
                  ),
                ),
              );
            } else {
              return SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.mainColorTheme,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
