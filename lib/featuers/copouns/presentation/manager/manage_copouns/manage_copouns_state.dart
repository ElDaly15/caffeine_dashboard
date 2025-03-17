part of 'manage_copouns_cubit.dart';

@immutable
sealed class ManageCopounsState {}

final class ManageCopounsInitial extends ManageCopounsState {}

//add
final class ManageCopounsAddSuccess extends ManageCopounsState {}

final class ManageCopounsAddFailuer extends ManageCopounsState {}

final class ManageCopounsAddLoading extends ManageCopounsState {}

//get
final class ManageCopounsGetSuccess extends ManageCopounsState {
  final List<CouponModel> coupons;

  ManageCopounsGetSuccess({required this.coupons});
}

final class ManageCopounsGetFailuer extends ManageCopounsState {}

final class ManageCopounsGetLoading extends ManageCopounsState {}
