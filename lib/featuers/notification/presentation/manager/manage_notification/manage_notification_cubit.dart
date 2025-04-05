import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/notification/data/models/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'manage_notification_state.dart';

class ManageNotificationCubit extends Cubit<ManageNotificationState> {
  ManageNotificationCubit() : super(ManageNotificationInitial());

  Future<void> updateNotification({
    required NotificationModel notification,
  }) async {
    try {
      emit((ManageNotificationUpdateLoading()));
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('notifications')
              .where('id', isEqualTo: notification.id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .update(notification.toJson())
          .then((_) => emit(ManageNotificationUpdateSuccess()))
          .catchError((error) => emit(ManageNotificationUpdateFailuer()));
    } catch (e) {
      emit(ManageNotificationUpdateFailuer());
    }
  }

  Future<void> deleteNotification({
    required NotificationModel notification,
  }) async {
    try {
      emit((ManageNotificationDeleteLoading()));
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('notifications')
              .where('id', isEqualTo: notification.id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .delete()
          .then((_) => emit(ManageNotificationDeleteSuccess()))
          .catchError((error) => emit(ManageNotificationDeleteFailuer()));
    } catch (e) {
      emit(ManageNotificationUpdateFailuer());
    }
  }
}
