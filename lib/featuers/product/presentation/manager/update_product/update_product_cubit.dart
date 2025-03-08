import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateProductInitial());
  void updateProduct({
    required String code,
    required String productNameAr,
    required String productNameEn,
    required String productDescriptionAr,
    required String productDescriptionEn,
    required String productCategory,
    required String productImage,
    required String productInfo,
    required String productPrice,
    required String productCode,
  }) async {
    try {
      emit(UpdateProductLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('products')
              .where('productCode', isEqualTo: code)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .update({
            'productNameAr': productNameAr,
            'productNameEn': productNameEn,
            'productDescriptionAr': productDescriptionAr,
            'productDescriptionEn': productDescriptionEn,
            'productCategory': productCategory,
            'productImage': productImage,
            'productInfo': productInfo,
            'productPrice': productPrice,
            'productCode': productCode,
          })
          .then((_) => emit(UpdateProductSuccess()))
          .catchError((error) => emit(UpdateProductFailuer()));
    } catch (e) {
      emit(UpdateProductFailuer());
    }
  }
}
