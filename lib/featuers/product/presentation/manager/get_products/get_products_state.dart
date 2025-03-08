part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  final List<ProductModel> products;

  GetProductsSuccess({required this.products});
}

final class GetProductsFailuer extends GetProductsState {
  final String error;

  GetProductsFailuer({required this.error});
}

final class GetProductsLoading extends GetProductsState {}
