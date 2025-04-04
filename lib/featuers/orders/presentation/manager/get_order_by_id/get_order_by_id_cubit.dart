import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/core/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_order_by_id_state.dart';

class GetOrderByIdCubit extends Cubit<GetOrderByIdState> {
  GetOrderByIdCubit() : super(GetOrderByIdInitial());

  List<OrderModel> orders = [];

  void getProductByCode({required String code}) async {
    try {
      emit(GetOrderByIdLoading());
      FirebaseFirestore.instance
          .collection('Orders')
          .where('orderId', isEqualTo: code)
          .limit(1)
          .snapshots()
          .listen((querySnapshot) {
            if (querySnapshot.docs.isEmpty) {
              emit(GetOrderByIdFailuer(error: 'No order found with this code'));
              return;
            }

            orders =
                querySnapshot.docs
                    .map((doc) => OrderModel.fromMap(doc.data()))
                    .toList();

            emit(GetOrderByIdSuccess(orderModel: orders[0]));
          });
    } catch (e) {
      emit(GetOrderByIdFailuer(error: 'An error occurred, Try again'));
    }
  }
}
