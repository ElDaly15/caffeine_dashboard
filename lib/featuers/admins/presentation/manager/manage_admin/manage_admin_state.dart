part of 'manage_admin_cubit.dart';

@immutable
sealed class ManageAdminState {}

final class ManageAdminInitial extends ManageAdminState {}

// update admin
final class ManageAdminUpdateLoading extends ManageAdminState {}

final class ManageAdminUpdateSuccess extends ManageAdminState {}

final class ManageAdminUpdateFailuer extends ManageAdminState {
  final String errorMsg;

  ManageAdminUpdateFailuer({required this.errorMsg});
}

// delete admin
final class ManageAdminDeleteLoading extends ManageAdminState {}

final class ManageAdminDeleteSuccess extends ManageAdminState {}

final class ManageAdminDeleteFailuer extends ManageAdminState {
  final String errorMsg;

  ManageAdminDeleteFailuer({required this.errorMsg});
}
