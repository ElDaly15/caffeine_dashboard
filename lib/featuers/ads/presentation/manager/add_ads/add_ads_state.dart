part of 'add_ads_cubit.dart';

@immutable
sealed class AddAdsState {}

final class AddAdsInitial extends AddAdsState {}

final class AddAdsSuccess extends AddAdsState {}

final class AddAdsFailuer extends AddAdsState {
  final Failuer failuer;

  AddAdsFailuer({required this.failuer});
}

final class AddAdsLoading extends AddAdsState {}
