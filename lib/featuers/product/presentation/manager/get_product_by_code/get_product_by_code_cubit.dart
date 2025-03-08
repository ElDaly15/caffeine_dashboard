import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_product_by_code_state.dart';

class GetProductByCodeCubit extends Cubit<GetProductByCodeState> {
  GetProductByCodeCubit() : super(GetProductByCodeInitial());

  List<ProductModel> products = [];

  void getProductByCode({required String code}) async {
    try {
      emit(GetProductsByCodeLoading());
      FirebaseFirestore.instance
          .collection('products')
          .where('productCode', isEqualTo: code)
          .limit(1)
          .snapshots()
          .listen((querySnapshot) {
            products =
                querySnapshot.docs
                    .map((doc) => ProductModel.fromJson(doc.data()))
                    .toList();

            emit(GetProductsByCodeSuccess(productModel: products[0]));
          });
    } catch (e) {
      emit(GetProductsByCodeFailuer(error: 'An error occurred , Try again'));
    }
  }
}
