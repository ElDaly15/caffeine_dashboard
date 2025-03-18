part of 'get_branches_cubit.dart';

@immutable
sealed class GetBranchesState {}

final class GetBranchesInitial extends GetBranchesState {}

final class GetBranchesSuccess extends GetBranchesState {
  final List<BranchModel> branches;

  GetBranchesSuccess({required this.branches});
}

final class GetBranchesFailuer extends GetBranchesState {
  final String errorMsg;

  GetBranchesFailuer({required this.errorMsg});
}

final class GetBranchesLoading extends GetBranchesState {}
