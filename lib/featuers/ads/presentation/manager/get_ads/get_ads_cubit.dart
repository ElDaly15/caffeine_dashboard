import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/ads/data/models/ads_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_ads_state.dart';

class GetAdsCubit extends Cubit<GetAdsState> {
  GetAdsCubit() : super(GetAdsInitial());
  List<AdsModel> ads = [];

  void getAds() async {
    try {
      emit(GetAdsLoading());
      FirebaseFirestore.instance.collection('ads').snapshots().listen((
        querySnapshot,
      ) {
        ads =
            querySnapshot.docs
                .map((doc) => AdsModel.fromJson(doc.data()))
                .toList();

        emit(GetAdsSuccess(ads: ads));
      });
    } catch (e) {
      emit(GetAdsFailuer(errorMsg: 'An error occurred , Try again'));
    }
  }
}
