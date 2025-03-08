import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  List<ProductModel> products = [];

  void getProducts() async {
    try {
      emit(GetProductsLoading());
      FirebaseFirestore.instance.collection('products').snapshots().listen((
        querySnapshot,
      ) {
        products =
            querySnapshot.docs
                .map((doc) => ProductModel.fromJson(doc.data()))
                .toList();

        emit(GetProductsSuccess(products: products));
      });
    } catch (e) {
      emit(GetProductsFailuer(error: 'An error occurred , Try again'));
    }
  }
}
