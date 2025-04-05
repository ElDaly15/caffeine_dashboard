part of 'send_notification_to_all_users_cubit.dart';

@immutable
sealed class SendNotificationToAllUsersState {}

final class SendNotificationToAllUsersInitial
    extends SendNotificationToAllUsersState {}

final class SendNotificationToAllUsersLoading
    extends SendNotificationToAllUsersState {}

final class SendNotificationToAllUsersSuccess
    extends SendNotificationToAllUsersState {}

final class SendNotificationToAllUsersError
    extends SendNotificationToAllUsersState {
  final String errorMessage;
  SendNotificationToAllUsersError(this.errorMessage);
}
