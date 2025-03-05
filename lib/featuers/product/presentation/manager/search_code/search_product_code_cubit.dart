import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'search_product_code_state.dart';

class SearchProductCodeCubit extends Cubit<SearchProductCodeState> {
  SearchProductCodeCubit() : super(SearchProductCodeInitial());

  Future<bool> searchProductCode(String code) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore
            .instance // To Get A Data To Email or anything you want
            .collection('products')
            .where('productCode', isEqualTo: code)
            .limit(1)
            .get();
    return querySnapshot.docs.isNotEmpty
        ? Future.value(true)
        : Future.value(false);
  }
}
