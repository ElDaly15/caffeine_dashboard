import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_copoun_state.dart';

class DeleteCopounCubit extends Cubit<DeleteCopounState> {
  DeleteCopounCubit() : super(DeleteCopounInitial());

  Future<void> deleteCopoun({required String id}) async {
    try {
      emit((DeleteCopounLoading()));
      QuerySnapshot querySnapshot =
          await FirebaseFirestore
              .instance // Get Data You Want To Update First
              .collection('copouns')
              .where('id', isEqualTo: id)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef
          .delete()
          .then((_) => emit(DeleteCopounSuccess()))
          .catchError((error) => emit(DeleteCopounFailuer()));
    } catch (e) {
      emit(DeleteCopounFailuer());
    }
  }
}
