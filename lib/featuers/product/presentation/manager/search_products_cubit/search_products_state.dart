part of 'search_products_cubit.dart';

@immutable
sealed class SearchProductsState {}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsSuccess extends SearchProductsState {
  final List<ProductModel> prodcutsSearched;

  SearchProductsSuccess({required this.prodcutsSearched});
}

final class SearchProductsFailuer extends SearchProductsState {
  final String errorMsg;

  SearchProductsFailuer({required this.errorMsg});
}

final class SearchProductsLoading extends SearchProductsState {}
