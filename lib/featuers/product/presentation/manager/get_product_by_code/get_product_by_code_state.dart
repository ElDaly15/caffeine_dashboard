part of 'get_product_by_code_cubit.dart';

@immutable
sealed class GetProductByCodeState {}

final class GetProductByCodeInitial extends GetProductByCodeState {}

final class GetProductsByCodeSuccess extends GetProductByCodeState {
  final ProductModel productModel;

  GetProductsByCodeSuccess({required this.productModel});
}

final class GetProductsByCodeLoading extends GetProductByCodeState {}

final class GetProductsByCodeFailuer extends GetProductByCodeState {
  final String error;

  GetProductsByCodeFailuer({required this.error});
}
