import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'update_order_status_state.dart';

class UpdateOrderStatusCubit extends Cubit<UpdateOrderStatusState> {
  UpdateOrderStatusCubit() : super(UpdateOrderStatusInitial());

  updateOrderStatus({
    required String orderId,
    required String userId,
    required int step,
    required String statusOfOrder,
  }) async {
    try {
      emit(UpdateOrderStatusLoading());
      var querySnapshotForUser =
          await FirebaseFirestore
              .instance // To Get A Data To Email or anything you want
              .collection('UsersData')
              .where('uid', isEqualTo: userId)
              .limit(1)
              .get();

      if (querySnapshotForUser.docs.isNotEmpty) {
        var doc = querySnapshotForUser.docs.first;
        List<dynamic> data = doc.data()['Orders'] ?? [];

        for (int i = 0; i < data.length; i++) {
          if (data[i]['orderId'] == orderId) {
            data[i]['stepperValue'] = step;
            data[i]['statusOfOrder'] = statusOfOrder;
            break;
          }
        }

        await FirebaseFirestore.instance
            .collection('UsersData')
            .doc(doc.id)
            .update({'Orders': data});
      }
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection('Orders')
              .where('orderId', isEqualTo: orderId)
              .limit(1)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        await FirebaseFirestore.instance
            .collection('Orders')
            .doc(doc.id)
            .update({'statusOfOrder': statusOfOrder, 'stepperValue': step});
      }
      emit(UpdateOrderStatusSuccess());
    } catch (e) {
      emit(UpdateOrderStatusFailuer());
    }
  }
}
