// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';

part 'Custom_reset_password_state.dart';

class CustomResetPasswordCubit extends Cubit<CustomResetPasswordState> {
  CustomResetPasswordCubit({required this.authrepo})
      : super(CustomResetPasswordInitial());
  final AuthRepo authrepo;
  Future<void> sendResetPasswordEmail(
      {required String email, required BuildContext context}) async {
    emit(CustomResetPasswordLoading());

    final result = await authrepo.resetPassword(
      email: email,
    );
    result.fold((failure) {
      emit(CustomResetPasswordFailure(errmessage: failure.message));
    }, (success) {
      emit(CustomResetPasswordSuccess());
    });
  }
}
