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
}
