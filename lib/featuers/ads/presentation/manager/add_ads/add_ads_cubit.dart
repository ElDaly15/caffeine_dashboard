import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/core/errors/failuer.dart';
import 'package:caffeine_dashboard/featuers/ads/data/models/ads_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_ads_state.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  AddAdsCubit() : super(AddAdsInitial());

  addAds(AdsModel adsModel) async {
    try {
      emit(AddAdsLoading());
      CollectionReference productCollection = FirebaseFirestore.instance
          .collection('ads');

      productCollection.add(adsModel.toJson());
      emit(AddAdsSuccess());
    } catch (e) {
      emit(
        AddAdsFailuer(
          failuer: Failuer(message: 'An Error Occurred While Adding Product'),
        ),
      );
    }
  }
}
