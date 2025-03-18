import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_branch_state.dart';

class DeleteBranchCubit extends Cubit<DeleteBranchState> {
  DeleteBranchCubit() : super(DeleteBranchInitial());

  Future<void> deleteBranch({required String id}) async {
    try {
      emit(DeleteBranchLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('branches')
              .where('id', isEqualTo: id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .delete()
          .then((_) => emit(DeleteBranchSuccess()))
          .catchError((error) => emit(DeleteBranchFailuer()));
    } catch (e) {
      emit(DeleteBranchFailuer());
    }
  }
}
