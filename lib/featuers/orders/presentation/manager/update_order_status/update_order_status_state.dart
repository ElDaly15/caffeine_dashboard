part of 'update_order_status_cubit.dart';

@immutable
sealed class UpdateOrderStatusState {}

final class UpdateOrderStatusInitial extends UpdateOrderStatusState {}

final class UpdateOrderStatusSuccess extends UpdateOrderStatusState {}

final class UpdateOrderStatusFailuer extends UpdateOrderStatusState {}

final class UpdateOrderStatusLoading extends UpdateOrderStatusState {}
