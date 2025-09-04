import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:meta/meta.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit({required this.authRepo})
      : super(UpdateUserDataInitial());
  final AuthRepo authRepo;

  Future<void> updateUser({
    required String? newPassword,
    required UserEntity userEntity,
    required String currentPassword,
  }) async {
    emit(UpdateUserDataLoading());
    final result = await authRepo.updateUser(newPassword,
        userEntity: userEntity, currentPassword: currentPassword);
    result.fold(
        (failure) => emit(UpdateUserDataFailure(message: failure.message)),
        (success) => emit(UpdateUserDataSuccess()));
  }
}
