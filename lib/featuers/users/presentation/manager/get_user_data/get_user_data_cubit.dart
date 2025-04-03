import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/users/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());
  List<UserModel> userModel = [];

  void getUserData({required String uid}) {
    try {
      emit(GetUserDataLoading());
      FirebaseFirestore.instance
          .collection('UsersData')
          .where('uid', isEqualTo: uid)
          .snapshots()
          .listen((querySnapshot) {
            userModel =
                querySnapshot.docs
                    .map((doc) => UserModel.fromFireStore(doc.data()))
                    .toList();

            if (userModel.isNotEmpty) {
              emit(GetUserDataSuccess(userModel: userModel[0]));
            } else {
              GetUserDataFailuer(error: 'No user found with this uid');
            }
          });
    } catch (e) {
      emit(GetUserDataFailuer(error: 'An error occurred , Try again'));
    }
  }
}
