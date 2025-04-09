part of 'get_admins_cubit.dart';

@immutable
sealed class GetAdminsState {}

final class GetAdminsInitial extends GetAdminsState {}

final class GetAdminsSuccess extends GetAdminsState {
  final List<AdminModel> admins;

  GetAdminsSuccess({required this.admins});
}

final class GetAdminsFailuer extends GetAdminsState {
  final String errorMsg;

  GetAdminsFailuer({required this.errorMsg});
}

final class GetAdminsLoading extends GetAdminsState {}
