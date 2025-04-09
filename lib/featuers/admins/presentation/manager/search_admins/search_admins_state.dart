part of 'search_admins_cubit.dart';

@immutable
sealed class SearchAdminsState {}

final class SearchAdminsInitial extends SearchAdminsState {}

final class SearchAdminsSuccess extends SearchAdminsState {
  final List<AdminModel> admins;

  SearchAdminsSuccess({required this.admins});
}

final class SearchAdminsFailuer extends SearchAdminsState {
  final String errorMsg;

  SearchAdminsFailuer({required this.errorMsg});
}

final class SearchAdminsLoading extends SearchAdminsState {}
