part of 'delete_ads_cubit.dart';

@immutable
sealed class DeleteAdsState {}

final class DeleteAdsInitial extends DeleteAdsState {}

final class DeleteAdsLoading extends DeleteAdsState {}

final class DeleteAdsSuccess extends DeleteAdsState {}

final class DeleteAdsFailuer extends DeleteAdsState {}
