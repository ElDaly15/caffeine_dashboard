part of 'update_order_status_cubit.dart';

@immutable
sealed class UpdateOrderStatusState {}

final class UpdateOrderStatusInitial extends UpdateOrderStatusState {}

final class UpdateOrderStatusSuccess extends UpdateOrderStatusState {}

final class UpdateOrderStatusFailuer extends UpdateOrderStatusState {}

final class UpdateOrderStatusLoading extends UpdateOrderStatusState {}

// Send Alert Notification States

final class SendAlertNotificationSuccess extends UpdateOrderStatusState {}

final class SendAlertNotificationLoading extends UpdateOrderStatusState {}

final class SendAlertNotificationError extends UpdateOrderStatusState {
  final String error;

  SendAlertNotificationError(this.error);
}
