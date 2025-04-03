part of 'ban_user_cubit.dart';

@immutable
sealed class BanUserState {}

final class BanUserInitial extends BanUserState {}

final class BanUserSuccess extends BanUserState {}

final class BanUserFailuer extends BanUserState {
  final String error;

  BanUserFailuer({required this.error});
}

final class BanUserLoading extends BanUserState {}

final class UnBanUserSuccess extends BanUserState {}

final class UnBanUserFailuer extends BanUserState {}

final class UnBanUserLoading extends BanUserState {}
