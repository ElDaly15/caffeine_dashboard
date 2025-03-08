import 'package:caffeine_dashboard/core/utils/app_colors.dart';
import 'package:caffeine_dashboard/core/utils/app_styles.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/manager/search_products_cubit/search_products_cubit.dart';
import 'package:caffeine_dashboard/featuers/product/presentation/views/widgets/list_view_of_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsViewBody extends StatelessWidget {
  const SearchProductsViewBody({super.key, required this.searchValue});
  final String searchValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<SearchProductsCubit, SearchProductsState>(
              builder: (context, state) {
                if (state is SearchProductsSuccess) {
                  if (state.prodcutsSearched.isEmpty || searchValue.isEmpty) {
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
                    return ListViewOfProducts(products: state.prodcutsSearched);
                  }
                } else if (state is SearchProductsFailuer) {
                  return Center(
                    child: Text(
                      state.errorMsg,
                      style: TextStyles.font20Regular(
                        context,
                      ).copyWith(color: AppColors.mainColorTheme),
                    ),
                  );
                } else if (state is SearchProductsLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColorTheme,
                    ),
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
          ),
        ],
      ),
    );
  }
}
