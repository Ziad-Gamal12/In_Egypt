part of 'update_user_data_cubit.dart';

@immutable
sealed class UpdateUserDataState {}

final class UpdateUserDataInitial extends UpdateUserDataState {}

// update user data state
final class UpdateUserDataLoading extends UpdateUserDataState {}

final class UpdateUserDataSuccess extends UpdateUserDataState {}

final class UpdateUserDataFailure extends UpdateUserDataState {
  final String message;
  UpdateUserDataFailure({required this.message});
}
