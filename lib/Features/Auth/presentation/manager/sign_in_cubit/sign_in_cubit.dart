// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.message));
      },
      (success) {
        emit(SignInSuccess());
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.message));
      },
      (success) {
        emit(SignInSuccess());
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.message));
      },
      (success) {
        emit(SignInSuccess());
      },
    );
  }
}
