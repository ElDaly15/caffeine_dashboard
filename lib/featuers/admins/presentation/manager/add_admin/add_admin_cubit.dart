import 'package:bloc/bloc.dart';
import 'package:caffeine_dashboard/core/errors/failuer.dart';
import 'package:caffeine_dashboard/featuers/admins/data/models/admin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminInitial());
  addAdmin(AdminModel adsModel) async {
    try {
      emit(AddAdminLoading());
      CollectionReference productCollection = FirebaseFirestore.instance
          .collection('admins');

      productCollection.add(adsModel.toJson());
      emit(AddAdminSuccess());
    } catch (e) {
      emit(
        AddAdminFailuer(
          failuer: Failuer(message: 'An Error Occurred While Adding Product'),
        ),
      );
    }
  }
}
