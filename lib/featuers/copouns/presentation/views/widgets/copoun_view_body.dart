import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/manager/manage_copouns/manage_copouns_cubit.dart';
import 'package:caffeine_dashboard/featuers/copouns/presentation/views/widgets/sliver_list_of_copouns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CopounViewBody extends StatefulWidget {
  const CopounViewBody({super.key});

  @override
  State<CopounViewBody> createState() => _CopounViewBodyState();
}

class _CopounViewBodyState extends State<CopounViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ManageCopounsCubit>(context).getCopouns();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        BlocBuilder<ManageCopounsCubit, ManageCopounsState>(
          builder: (context, state) {
            if (state is ManageCopounsGetSuccess) {
              if (state.coupons.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      'No copouns found',
                      style: TextStyles.font20Regular(
                        context,
                      ).copyWith(color: AppColors.mainColorTheme),
                    ),
                  ),
                );
              } else {
                return SliverListOfCopouns(coupons: state.coupons);
              }
            } else if (state is ManageCopounsGetFailuer) {
              return SliverFillRemaining(
                child: Center(
                  child: Text(
                    'An error occurred while getting copouns',
                    style: TextStyles.font20Regular(
                      context,
                    ).copyWith(color: AppColors.mainColorTheme),
                  ),
                ),
              );
            }
            return SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainColorTheme,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
