import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'check_user_login_state.dart';

class CheckUserLoginCubit extends Cubit<CheckUserLoginState> {
  CheckUserLoginCubit() : super(CheckUserLoginInitial());

  void checkUserLogin({
    required String userName,
    required String password,
  }) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // To Get A Data To Email or anything you want
              .collection('admins')
              .where('userName', isEqualTo: userName)
              .limit(1)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        if (querySnapshot.docs[0]['password'] == password) {
          emit(
            CheckUserLoginSuccess(
              isMainAdmin: querySnapshot.docs[0]['isMainAdmin'],
            ),
          );
        } else {
          emit(CheckUserLoginFailuer(errorMsg: 'The Password is Incorrect'));
        }
      } else {
        emit(CheckUserLoginFailuer(errorMsg: 'The UserName is Incorrect'));
      }
    } catch (e) {
      emit(CheckUserLoginFailuer(errorMsg: 'An Error Occurred While Login'));
    }
  }
}
