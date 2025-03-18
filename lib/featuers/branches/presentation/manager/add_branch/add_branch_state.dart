part of 'add_branch_cubit.dart';

@immutable
sealed class AddBranchState {}

final class AddBranchInitial extends AddBranchState {}

final class AddBranchSuccess extends AddBranchState {}

final class AddBranchLoading extends AddBranchState {}

final class AddBranchFailuer extends AddBranchState {
  final String message;

  AddBranchFailuer({required this.message});
}
