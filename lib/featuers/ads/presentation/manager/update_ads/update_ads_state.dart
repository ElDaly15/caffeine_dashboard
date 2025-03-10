part of 'update_ads_cubit.dart';

@immutable
sealed class UpdateAdsState {}

final class UpdateAdsInitial extends UpdateAdsState {}

final class UpdateAdsSuccess extends UpdateAdsState {}

final class UpdateAdsLoading extends UpdateAdsState {}

final class UpdateAdsFailuer extends UpdateAdsState {}
