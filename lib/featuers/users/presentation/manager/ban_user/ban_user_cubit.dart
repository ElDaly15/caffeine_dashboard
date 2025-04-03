import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'ban_user_state.dart';

class BanUserCubit extends Cubit<BanUserState> {
  BanUserCubit() : super(BanUserInitial());

  Future<void> banUser(String userId, String bannedBy) async {
    try {
      emit(BanUserLoading());
      await FirebaseFirestore.instance
          .collection('banned_users')
          .doc(userId)
          .set({
            'banned': true,
            'banned_by': bannedBy,
            'banned_at': FieldValue.serverTimestamp(),
          });
      emit(BanUserSuccess());
    } catch (e) {
      emit(BanUserFailuer(error: 'An error occurred , Try again'));
    }
  }

  Future<void> unbanUser(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('banned_users')
          .doc(userId)
          .delete();
      emit(UnBanUserSuccess());
    } catch (e) {
      emit(UnBanUserFailuer());
    }
  }
}
