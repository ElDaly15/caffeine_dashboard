part of 'get_notifications_cubit.dart';

@immutable
sealed class GetNotificationsState {}

final class GetNotificationsInitial extends GetNotificationsState {}

final class GetNotificationsSuccess extends GetNotificationsState {
  final List<NotificationModel> notifications;

  GetNotificationsSuccess({required this.notifications});
}

final class GetNotificationsFailuer extends GetNotificationsState {}

final class GetNotificationsLoading extends GetNotificationsState {}
