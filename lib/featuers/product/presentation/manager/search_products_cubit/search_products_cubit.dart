import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  SearchProductsCubit() : super(SearchProductsInitial());

  List<ProductModel> products = [];
  Future<void> searchProducts({required String searchValue}) async {
    try {
      emit(SearchProductsLoading());
      products = [];
      FirebaseFirestore.instance.collection('products').snapshots().listen((
        querySnapshot,
      ) {
        products =
            querySnapshot.docs
                .map(
                  (doc) =>
                  // ignore: unnecessary_cast
                  ProductModel.fromJson(doc.data()),
                )
                .where(
                  (user) =>
                      user.productNameEn.toLowerCase().contains(
                        searchValue.toLowerCase(),
                      ) ||
                      user.productNameAr.toLowerCase().contains(
                        searchValue.toLowerCase(),
                      ),
                )
                .toList();

        emit(SearchProductsSuccess(prodcutsSearched: products));
      });
    } catch (e) {
      emit(
        SearchProductsFailuer(errorMsg: 'An error occurred. Please try again.'),
      );
    }
  }
}
