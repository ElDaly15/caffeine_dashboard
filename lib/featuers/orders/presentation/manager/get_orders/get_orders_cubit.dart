import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/core/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersInitial());
  List<OrderModel> orders = [];

  void getOrders() async {
    try {
      emit(GetOrdersLoading());
      FirebaseFirestore.instance.collection('Orders').snapshots().listen((
        querySnapshot,
      ) {
        orders =
            querySnapshot.docs
                .map((doc) => OrderModel.fromMap(doc.data()))
                .toList();

        // Sort the orders manually based on the date field
        orders.sort((a, b) => b.date.compareTo(a.date)); // Newest first

        emit(GetOrdersSuccess(orders: orders));
      });
    } catch (e) {
      emit(GetOrdersFailuer(error: 'An error occurred, Try again'));
    }
  }
}
