import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/admins/data/models/admin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'search_admins_state.dart';

class SearchAdminsCubit extends Cubit<SearchAdminsState> {
  SearchAdminsCubit() : super(SearchAdminsInitial());

  List<AdminModel> admins = [];
  Future<void> searchAdmins({required String searchValue}) async {
    try {
      emit(SearchAdminsLoading());
      admins = [];
      FirebaseFirestore.instance.collection('admins').snapshots().listen((
        querySnapshot,
      ) {
        admins =
            querySnapshot.docs
                .map(
                  (doc) =>
                  // ignore: unnecessary_cast
                  AdminModel.fromJson(doc.data()),
                )
                .where(
                  (user) => user.userName.toLowerCase().contains(
                    searchValue.toLowerCase(),
                  ),
                )
                .toList();

        emit(SearchAdminsSuccess(admins: admins));
      });
    } catch (e) {
      emit(
        SearchAdminsFailuer(errorMsg: 'An error occurred. Please try again.'),
      );
    }
  }
}
