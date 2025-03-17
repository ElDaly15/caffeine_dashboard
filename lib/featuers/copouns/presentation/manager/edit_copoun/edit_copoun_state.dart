part of 'edit_copoun_cubit.dart';

@immutable
sealed class EditCopounState {}

final class EditCopounInitial extends EditCopounState {}

final class EditCopounLoading extends EditCopounState {}

final class EditCopounSuccess extends EditCopounState {}

final class EditCopounFailuer extends EditCopounState {}
