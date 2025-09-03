// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/core/errors/Failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signUpWithEmailAndPassword({
    required UserEntity userEntity,
    required String password,
  });
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signInWithFacebook();
Future<Either<Failure,void>>updateUser(String? newPassword,{ required UserEntity userEntity,required String currentPassword, });
}
