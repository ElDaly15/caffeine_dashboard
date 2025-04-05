import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/notification/data/models/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit() : super(GetNotificationsInitial());

  List<NotificationModel> notifications = [];

  Future<void> getNotifications() async {
    try {
      emit(GetNotificationsLoading());
      FirebaseFirestore.instance
          .collection('notifications')
          .orderBy('date', descending: true)
          .snapshots()
          .listen((querySnapshot) {
            notifications =
                querySnapshot.docs.map((doc) {
                  return NotificationModel.fromJson(doc.data());
                }).toList();
            emit(GetNotificationsSuccess(notifications: notifications));
          });
    } on Exception {
      emit(GetNotificationsFailuer());
    }
  }
}
