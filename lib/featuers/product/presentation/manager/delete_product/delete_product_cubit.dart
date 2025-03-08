import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit() : super(DeleteProductInitial());

  Future<void> deleteProduct({required String code}) async {
    try {
      emit(DeleteProductLoading());
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
          .delete()
          .then((_) => emit(DeleteProductSuccess()))
          .catchError((error) => emit(DeleteProductFailuer()));
    } catch (e) {
      emit(DeleteProductFailuer());
    }
  }
}
