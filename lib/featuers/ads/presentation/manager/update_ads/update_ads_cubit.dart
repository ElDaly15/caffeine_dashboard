import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'update_ads_state.dart';

class UpdateAdsCubit extends Cubit<UpdateAdsState> {
  UpdateAdsCubit() : super(UpdateAdsInitial());
  Future<void> updateAds({
    required String id,
    required String title,
    required String url,
  }) async {
    try {
      emit(UpdateAdsLoading());
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
          .update({'title': title, 'url': url})
          .then((_) => emit(UpdateAdsSuccess()))
          .catchError((error) => emit(UpdateAdsFailuer()));
    } catch (e) {
      emit(UpdateAdsFailuer());
    }
  }
}
