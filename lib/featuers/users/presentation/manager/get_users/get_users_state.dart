part of 'get_users_cubit.dart';

@immutable
sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersSuccess extends GetUsersState {
  final List<UserModel> users;

  GetUsersSuccess({required this.users});
}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersFailuer extends GetUsersState {
  final String error;

  GetUsersFailuer({required this.error});
}
