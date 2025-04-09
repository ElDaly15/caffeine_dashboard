part of 'check_user_login_cubit.dart';

@immutable
sealed class CheckUserLoginState {}

final class CheckUserLoginInitial extends CheckUserLoginState {}

final class CheckUserLoginSuccess extends CheckUserLoginState {
  final bool isMainAdmin;

  CheckUserLoginSuccess({required this.isMainAdmin});
}

final class CheckUserLoginFailuer extends CheckUserLoginState {
  final String errorMsg;

  CheckUserLoginFailuer({required this.errorMsg});
}

final class CheckUserLoginLoading extends CheckUserLoginState {}
