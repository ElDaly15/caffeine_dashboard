part of 'edit_branch_cubit.dart';

@immutable
sealed class EditBranchState {}

final class EditBranchInitial extends EditBranchState {}

final class EditBranchSuccess extends EditBranchState {}

final class EditBranchLoading extends EditBranchState {}

final class EditBranchFailuer extends EditBranchState {}
