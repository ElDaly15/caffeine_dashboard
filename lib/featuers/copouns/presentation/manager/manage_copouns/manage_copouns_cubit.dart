import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/copouns/data/model/coupon_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'manage_copouns_state.dart';

class ManageCopounsCubit extends Cubit<ManageCopounsState> {
  ManageCopounsCubit() : super(ManageCopounsInitial());

  List<CouponModel> coupons = [];

  addCopoun(CouponModel couponModel) async {
    try {
      emit(ManageCopounsAddLoading());
      CollectionReference productCollection = FirebaseFirestore.instance
          .collection('copouns');

      productCollection.add(couponModel.toJson());
      emit(ManageCopounsAddSuccess());
    } catch (e) {
      emit(ManageCopounsAddFailuer());
    }
  }

  void getCopouns() async {
    try {
      emit(ManageCopounsGetLoading());
      FirebaseFirestore.instance.collection('copouns').snapshots().listen((
        querySnapshot,
      ) {
        coupons =
            querySnapshot.docs
                .map((doc) => CouponModel.fromJson(doc.data()))
                .toList();

        emit(ManageCopounsGetSuccess(coupons: coupons));
      });
    } catch (e) {
      emit(ManageCopounsGetFailuer());
    }
  }
}
