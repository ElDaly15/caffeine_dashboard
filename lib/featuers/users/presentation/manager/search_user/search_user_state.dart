part of 'search_user_cubit.dart';

@immutable
sealed class SearchUserState {}

final class SearchUserInitial extends SearchUserState {}

final class SearchUserSuccess extends SearchUserState {
  final List<UserModel> users;

  SearchUserSuccess({required this.users});
}

final class SearchUserFailuer extends SearchUserState {
  final String errorMsg;

  SearchUserFailuer({required this.errorMsg});
}

final class SearchUserLoading extends SearchUserState {}
