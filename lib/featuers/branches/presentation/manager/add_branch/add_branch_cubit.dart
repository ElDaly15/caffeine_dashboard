import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_branch_state.dart';

class AddBranchCubit extends Cubit<AddBranchState> {
  AddBranchCubit() : super(AddBranchInitial());

  addBranch(BranchModel brachModel) async {
    try {
      emit(AddBranchLoading());
      CollectionReference productCollection = FirebaseFirestore.instance
          .collection('branches');

      productCollection.add(brachModel.toJson());
      emit(AddBranchSuccess());
    } catch (e) {
      emit(AddBranchFailuer(message: 'An Error Occurred While Adding Branch'));
    }
  }
}
