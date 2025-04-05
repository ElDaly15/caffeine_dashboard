part of 'manage_notification_cubit.dart';

@immutable
sealed class ManageNotificationState {}

final class ManageNotificationInitial extends ManageNotificationState {}

/// This state is used when the notification is being updated
final class ManageNotificationUpdateSuccess extends ManageNotificationState {}

final class ManageNotificationUpdateLoading extends ManageNotificationState {}

final class ManageNotificationUpdateFailuer extends ManageNotificationState {}

/// This state is used when the notification is being deleted

final class ManageNotificationDeleteLoading extends ManageNotificationState {}

final class ManageNotificationDeleteSuccess extends ManageNotificationState {}

final class ManageNotificationDeleteFailuer extends ManageNotificationState {}
