import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/admins/data/models/admin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'manage_admin_state.dart';

class ManageAdminCubit extends Cubit<ManageAdminState> {
  ManageAdminCubit() : super(ManageAdminInitial());

  Future<void> updateAdmin({required AdminModel adminModel}) async {
    try {
      emit((ManageAdminUpdateLoading()));
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('admins')
              .where('id', isEqualTo: adminModel.id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .update(adminModel.toJson())
          .then((_) => emit(ManageAdminUpdateSuccess()))
          .catchError(
            (error) => emit(
              ManageAdminUpdateFailuer(
                errorMsg: 'An error occurred While Updating Admin',
              ),
            ),
          );
    } catch (e) {
      emit(
        ManageAdminUpdateFailuer(
          errorMsg: 'An error occurred While Updating Admin',
        ),
      );
    }
  }

  Future<void> deleteAdmin({required AdminModel adminModel}) async {
    try {
      emit((ManageAdminDeleteLoading()));
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('admins')
              .where('id', isEqualTo: adminModel.id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .delete()
          .then((_) => emit(ManageAdminDeleteSuccess()))
          .catchError(
            (error) => emit(
              ManageAdminDeleteFailuer(
                errorMsg: 'An error occurred While Deleting Admin',
              ),
            ),
          );
    } catch (e) {
      emit(
        ManageAdminDeleteFailuer(
          errorMsg: 'An error occurred While Deleting Admin',
        ),
      );
    }
  }
}
