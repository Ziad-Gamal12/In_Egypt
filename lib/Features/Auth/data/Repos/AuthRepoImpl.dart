// ignore_for_file: file_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:in_egypt/Features/Auth/data/models/UserModel.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/services/FirebaseAuth_Service.dart';
import 'package:in_egypt/core/services/Shared_preferences.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';

class AuthRepoImpl implements AuthRepo {
  final firebaseAuthService authService;
  final Databaseservice databaseservice;
  AuthRepoImpl({required this.authService, required this.databaseservice});

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await authService.signInWithEmailAndPassword(email, password);
      if (user.emailVerified) {
        return await fetchUserAndStoreLocally(user.uid);
      } else {
        await user.sendEmailVerification();
        return Left(ServerFailure(message: "يرجى التحقق من البريد الإلكتروني"));
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword({
    required UserEntity userEntity,
    required String password,
  }) async {
    User? user;
    try {
      user = await authService.createUserWithEmailAndPassword(
        userEntity.email,
        password,
        "${userEntity.firstName} ${userEntity.lastName}",
      );
      userEntity.uid = user.uid;
      final userModel = UserModel.fromEntity(userEntity);
      await Future.wait([
        storeUserDataInFireStore(userjson: userModel.toJson(), uid: user.uid),
        user.sendEmailVerification(),
        authService.signout(),
      ]);
      return Right(null);
    } on CustomException catch (e) {
      deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      deleteUser(user);
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  Future<void> deleteUser(User? user) async {
    try {
      if (user != null) {
        await user.delete();
      }
    } catch (e) {
      throw CustomException(message: "حدث خطأ أثناء حذف المستخدم");
    }
  }

  Future<void> storeUserLocally(Map<String, dynamic> userJson) async {
    String userJsonString = jsonEncode(userJson);
    await shared_preferences_Services.stringSetter(
      key: Backendkeys.storeUserLocaly,
      value: userJsonString,
    );
  }

  Future<Either<Failure, void>> fetchUserAndStoreLocally(String uid) async {
    try {
      final json = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.usersCollection,
          docId: uid,
        ),
      );
      if (json != null) {
        await storeUserLocally(json);
        return Right(null);
      } else {
        return Left(ServerFailure(message: "لم يتم العثور على المستخدم"));
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithFacebook() async {
    bool isExists = false;
    User? user;
    try {
      user = await authService.signinWithFacebook();
      isExists = await databaseservice.isDataExists(
        key: Backendkeys.usersCollection,
        docId: user.uid,
      );
      if (isExists) {
        return await fetchUserAndStoreLocally(user.uid);
      } else {
        return await storeUserDataInFireStore(
          userjson: UserModel.fromEntity(
            UserEntity(
              uid: user.uid,
              phoneNumber: user.phoneNumber ?? "",
              firstName: user.displayName ?? "",
              createdAt: DateTime.now().toIso8601String(),
              isBlocked: false,
              photoUrl: user.photoURL ?? "",
              isVerified: true,
              role: "User",
              lastName: "",
              email: user.email ?? "",
            ),
          ).toJson(),
          uid: user.uid,
        );
      }
    } on CustomException catch (e) {
      if (isExists == false) {
        deleteUser(user);
      } else {
        await authService.signout();
      }
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      if (isExists == false) {
        deleteUser(user);
      } else {
        await authService.signout();
      }
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    bool isExists = false;
    User? user;
    try {
      user = await authService.signinWithGoogle();
      isExists = await databaseservice.isDataExists(
        key: Backendkeys.usersCollection,
        docId: user.uid,
      );
      if (isExists) {
        return await fetchUserAndStoreLocally(user.uid);
      } else {
        return await storeUserDataInFireStore(
          userjson: UserModel.fromEntity(
            UserEntity(
              uid: user.uid,
              phoneNumber: user.phoneNumber ?? "",
              firstName: user.displayName ?? "",
              createdAt: DateTime.now().toIso8601String(),
              isBlocked: false,
              photoUrl: user.photoURL ?? "",
              role: "User",
              isVerified: true,
              lastName: "",
              email: user.email ?? "",
            ),
          ).toJson(),
          uid: user.uid,
        );
      }
    } on CustomException catch (e) {
      if (isExists == false) {
        deleteUser(user);
      } else {
        await authService.signout();
      }
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      if (isExists == false) {
        deleteUser(user);
      } else {
        await authService.signout();
      }
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  Future<Either<Failure, void>> storeUserDataInFireStore({
    required Map<String, dynamic> userjson,
    required String uid,
  }) async {
    try {
      await databaseservice.setData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.usersCollection,
          docId: uid,
        ),
        data: userjson,
      );
      return Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
