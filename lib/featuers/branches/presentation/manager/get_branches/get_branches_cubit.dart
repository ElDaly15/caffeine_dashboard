import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/featuers/branches/data/models/branch_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_branches_state.dart';

class GetBranchesCubit extends Cubit<GetBranchesState> {
  GetBranchesCubit() : super(GetBranchesInitial());
  List<BranchModel> branches = [];

  void getBranches() async {
    try {
      emit(GetBranchesLoading());
      FirebaseFirestore.instance.collection('branches').snapshots().listen((
        querySnapshot,
      ) {
        branches =
            querySnapshot.docs
                .map((doc) => BranchModel.fromJson(doc.data()))
                .toList();

        emit(GetBranchesSuccess(branches: branches));
      });
    } catch (e) {
      emit(GetBranchesFailuer(errorMsg: 'An error occurred , Try again'));
    }
  }
}
