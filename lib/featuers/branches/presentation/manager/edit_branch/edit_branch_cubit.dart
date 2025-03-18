import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'edit_branch_state.dart';

class EditBranchCubit extends Cubit<EditBranchState> {
  EditBranchCubit() : super(EditBranchInitial());
  Future<void> editBranch({required BranchModel branchmodel}) async {
    try {
      emit(EditBranchLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('branches')
              .where('id', isEqualTo: branchmodel.id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .update({
            'branchnameEn': branchmodel.branchnameEn,
            'branchnameAr': branchmodel.branchnameAr,
            'cityEn': branchmodel.cityEn,
            'cityAr': branchmodel.cityAr,
            'streetEn': branchmodel.streetEn,
            'streetAr': branchmodel.streetAr,
            'countryEn': branchmodel.countryEn,
            'countryAr': branchmodel.countryAr,
          })
          .then((_) => emit(EditBranchSuccess()))
          .catchError((error) => emit(EditBranchFailuer()));
    } catch (e) {
      emit(EditBranchFailuer());
    }
  }
}
