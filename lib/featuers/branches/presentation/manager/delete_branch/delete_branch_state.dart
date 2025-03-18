part of 'delete_branch_cubit.dart';

@immutable
sealed class DeleteBranchState {}

final class DeleteBranchInitial extends DeleteBranchState {}

final class DeleteBranchSuccess extends DeleteBranchState {}

final class DeleteBranchLoading extends DeleteBranchState {}

final class DeleteBranchFailuer extends DeleteBranchState {}
