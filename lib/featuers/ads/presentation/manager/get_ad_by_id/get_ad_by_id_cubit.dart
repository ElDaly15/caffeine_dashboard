import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/ads/data/models/ads_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_ad_by_id_state.dart';

class GetAdByIdCubit extends Cubit<GetAdByIdState> {
  GetAdByIdCubit() : super(GetAdByIdInitial());

  List<AdsModel> ads = [];
  void getAdById({required String id}) async {
    try {
      emit(GetAdByIdLoading());
      FirebaseFirestore.instance
          .collection('ads')
          .where('id', isEqualTo: id)
          .limit(1)
          .snapshots()
          .listen((querySnapshot) {
            if (querySnapshot.docs.isEmpty) {
              return;
            }

            ads =
                querySnapshot.docs
                    .map((doc) => AdsModel.fromJson(doc.data()))
                    .toList();

            emit(GetAdByIdSuccess(adsModel: ads[0]));
          });
    } catch (e) {
      emit(GetAdByIdFailuer(error: 'An error occurred, Try again'));
    }
  }
}
