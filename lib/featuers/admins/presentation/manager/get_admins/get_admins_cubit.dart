import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/admins/data/models/admin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_admins_state.dart';

class GetAdminsCubit extends Cubit<GetAdminsState> {
  GetAdminsCubit() : super(GetAdminsInitial());
  List<AdminModel> admins = [];

  void getAdmins() async {
    try {
      emit(GetAdminsLoading());
      FirebaseFirestore.instance.collection('admins').snapshots().listen((
        querySnapshot,
      ) {
        admins =
            querySnapshot.docs
                .map((doc) => AdminModel.fromJson(doc.data()))
                .toList();

        emit(GetAdminsSuccess(admins: admins));
      });
    } catch (e) {
      emit(GetAdminsFailuer(errorMsg: 'An error occurred , Try again'));
    }
  }
}
