import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/copouns/data/model/coupon_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'edit_copoun_state.dart';

class EditCopounCubit extends Cubit<EditCopounState> {
  EditCopounCubit() : super(EditCopounInitial());

  Future<void> editCopoun({required CouponModel copounModel}) async {
    try {
      emit(EditCopounLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('copouns')
              .where('id', isEqualTo: copounModel.id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .update({
            'copounTitle': copounModel.copounTitle,
            'copounCode': copounModel.copounCode,
            'copounValue': copounModel.copounValue,
            'isExpired': copounModel.isExpired,
          })
          .then((_) => emit(EditCopounSuccess()))
          .catchError((error) => emit(EditCopounFailuer()));
    } catch (e) {
      emit(EditCopounFailuer());
    }
  }
}
