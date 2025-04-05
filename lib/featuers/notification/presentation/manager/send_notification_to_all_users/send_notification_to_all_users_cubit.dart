import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/notification/data/services/cloud_messaging/cloud_messaging.dart';
import 'package:meta/meta.dart';

part 'send_notification_to_all_users_state.dart';

class SendNotificationToAllUsersCubit
    extends Cubit<SendNotificationToAllUsersState> {
  SendNotificationToAllUsersCubit()
    : super(SendNotificationToAllUsersInitial());

  Future<void> sendNotificationToAllUsers(
    String tripId,
    String messageTitleEn,
    String messageTitleAr,
    String messageBodyEn,
    String messageBodyAr,
  ) async {
    emit(SendNotificationToAllUsersLoading());
    try {
      await PushNotificationService.sendNotificationToAllUsers(
        tripId,
        messageTitleEn,
        messageTitleAr,
        messageBodyEn,
        messageBodyAr,
      );
      emit(SendNotificationToAllUsersSuccess());
    } catch (e) {
      emit(SendNotificationToAllUsersError(e.toString()));
    }
  }
}
