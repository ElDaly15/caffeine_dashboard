import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/users/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit() : super(GetUsersInitial());

  List<UserModel> users = [];

  void getUsers() async {
    try {
      emit(GetUsersLoading());
      FirebaseFirestore.instance.collection('UsersData').snapshots().listen((
        querySnapshot,
      ) {
        users =
            querySnapshot.docs
                .map((doc) => UserModel.fromFireStore(doc.data()))
                .toList();

        emit(GetUsersSuccess(users: users));
      });
    } catch (e) {
      emit(GetUsersFailuer(error: 'An error occurred , Try again'));
    }
  }
}
