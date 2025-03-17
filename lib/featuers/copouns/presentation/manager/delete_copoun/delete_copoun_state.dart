part of 'delete_copoun_cubit.dart';

@immutable
sealed class DeleteCopounState {}

final class DeleteCopounInitial extends DeleteCopounState {}

final class DeleteCopounLoading extends DeleteCopounState {}

final class DeleteCopounSuccess extends DeleteCopounState {}

final class DeleteCopounFailuer extends DeleteCopounState {}
