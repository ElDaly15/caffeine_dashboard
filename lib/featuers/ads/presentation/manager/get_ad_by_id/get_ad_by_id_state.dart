part of 'get_ad_by_id_cubit.dart';

@immutable
sealed class GetAdByIdState {}

final class GetAdByIdInitial extends GetAdByIdState {}

final class GetAdByIdLoading extends GetAdByIdState {}

final class GetAdByIdSuccess extends GetAdByIdState {
  final AdsModel adsModel;

  GetAdByIdSuccess({required this.adsModel});
}

final class GetAdByIdFailuer extends GetAdByIdState {
  final String error;

  GetAdByIdFailuer({required this.error});
}
