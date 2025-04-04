part of 'get_order_by_id_cubit.dart';

@immutable
sealed class GetOrderByIdState {}

final class GetOrderByIdInitial extends GetOrderByIdState {}

final class GetOrderByIdSuccess extends GetOrderByIdState {
  final OrderModel orderModel;

  GetOrderByIdSuccess({required this.orderModel});
}

final class GetOrderByIdFailuer extends GetOrderByIdState {
  final String error;

  GetOrderByIdFailuer({required this.error});
}

final class GetOrderByIdLoading extends GetOrderByIdState {}
