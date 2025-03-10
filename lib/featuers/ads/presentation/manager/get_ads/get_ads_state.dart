part of 'get_ads_cubit.dart';

@immutable
sealed class GetAdsState {}

final class GetAdsInitial extends GetAdsState {}

final class GetAdsLoading extends GetAdsState {}

final class GetAdsSuccess extends GetAdsState {
  final List<AdsModel> ads;

  GetAdsSuccess({required this.ads});
}

final class GetAdsFailuer extends GetAdsState {
  final String errorMsg;

  GetAdsFailuer({required this.errorMsg});
}
