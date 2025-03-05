import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/core/errors/failuer.dart';
import 'package:caffeine_dashboard/featuers/product/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  addProduct(ProductModel productModel) {
    try {
      emit(AddProductLoading());
      CollectionReference productCollection = FirebaseFirestore.instance
          .collection('products');

      productCollection.add(productModel.toJson());
      emit(AddProductSuccess());
    } catch (e) {
      emit(
        AddProductFailuer(
          failuer: Failuer(message: 'An Error Occurred While Adding Product'),
        ),
      );
    }
  }
}
