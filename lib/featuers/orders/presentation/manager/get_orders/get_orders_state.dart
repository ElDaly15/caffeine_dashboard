part of 'get_orders_cubit.dart';

@immutable
sealed class GetOrdersState {}

final class GetOrdersInitial extends GetOrdersState {}

final class GetOrdersSuccess extends GetOrdersState {
  final List<OrderModel> orders;

  GetOrdersSuccess({required this.orders});
}

final class GetOrdersFailuer extends GetOrdersState {
  final String error;

  GetOrdersFailuer({required this.error});
}

final class GetOrdersLoading extends GetOrdersState {}
