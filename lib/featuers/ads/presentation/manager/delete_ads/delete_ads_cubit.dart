import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_ads_state.dart';

class DeleteAdsCubit extends Cubit<DeleteAdsState> {
  DeleteAdsCubit() : super(DeleteAdsInitial());
  Future<void> deleteAd({required String id}) async {
    try {
      emit(DeleteAdsLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('ads')
              .where('id', isEqualTo: id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .delete()
          .then((_) => emit(DeleteAdsSuccess()))
          .catchError((error) => emit(DeleteAdsFailuer()));
    } catch (e) {
      emit(DeleteAdsFailuer());
    }
  }
}
