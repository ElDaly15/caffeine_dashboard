import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/users/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'search_user_state.dart';

class SearchUserCubit extends Cubit<SearchUserState> {
  SearchUserCubit() : super(SearchUserInitial());
  List<UserModel> users = [];
  Future<void> searchUsers({required String searchValue}) async {
    try {
      emit(SearchUserLoading());
      users = [];
      FirebaseFirestore.instance.collection('UsersData').snapshots().listen((
        querySnapshot,
      ) {
        users =
            querySnapshot.docs
                .map(
                  (doc) =>
                  // ignore: unnecessary_cast
                  UserModel.fromFireStore(doc.data()),
                )
                .where(
                  (user) =>
                      user.name.toLowerCase().contains(
                        searchValue.toLowerCase(),
                      ) ||
                      user.uid.toLowerCase().contains(
                        searchValue.toLowerCase(),
                      ) ||
                      user.email.toLowerCase().contains(
                        searchValue.toLowerCase(),
                      ),
                )
                .toList();

        emit(SearchUserSuccess(users: users));
      });
    } catch (e) {
      emit(SearchUserFailuer(errorMsg: 'An error occurred. Please try again.'));
    }
  }
}
