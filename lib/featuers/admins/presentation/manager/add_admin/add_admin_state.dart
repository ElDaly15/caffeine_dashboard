part of 'add_admin_cubit.dart';

@immutable
sealed class AddAdminState {}

final class AddAdminInitial extends AddAdminState {}

final class AddAdminSuccess extends AddAdminState {}

final class AddAdminFailuer extends AddAdminState {
  final Failuer failuer;

  AddAdminFailuer({required this.failuer});
}

final class AddAdminLoading extends AddAdminState {}
