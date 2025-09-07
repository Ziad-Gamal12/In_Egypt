// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:in_egypt/Features/Auth/data/models/UserModel.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt/core/Entities/FireStorePaginateResponse.dart';
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
      if (user.emailVerified == false) {
        await user.sendEmailVerification();
        await authService.signout();
        return Left(ServerFailure(
            message:
                "📩 بعتنالك رسالة تأكيد على إيميلك، لو مش لاقيها في الـ Inbox بص في الـ Spam."));
      } else {
        final result = await fetchUserAndStoreLocally(user.uid);
        if (result.isLeft()) {
          authService.signout();
          return result;
        } else {
          return Right(null);
        }
      }
    } on CustomException catch (e) {
      log(e.message);
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

      return await storeUserDataInFireStore(
          user: user, userjson: userModel.toJson(), uid: user.uid);
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
    } catch (e, s) {
      ("$e\n$s");

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
      FireStoreResponse json = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.usersCollection,
          docId: uid,
        ),
      );
      if (json.docData != null) {
        Map<String, dynamic> userJson = json.docData!;
        UserEntity userEntity = UserModel.fromJson(userJson).toEntity();
        if (userEntity.isBlocked == false) {
          if (userEntity.isVerified == true) {
            await storeUserLocally(userJson);
          } else {
            return Left(ServerFailure(message: "لم يتم التفعيل بعد"));
          }
        } else {
          return Left(ServerFailure(message: "لقد تم حظرك من التطبيق"));
        }
        return Right(null);
      } else {
        return Left(ServerFailure(message: "لم يتم العثور على المستخدم"));
      }
    } on CustomException catch (e) {
      authService.signout();
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      authService.signout();
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
          signOut: false,
          user: user,
          userjson: UserModel.fromEntity(
            UserEntity(
              uid: user.uid,
              phoneNumber: user.phoneNumber ?? "",
              firstName: user.displayName ?? "",
              fullName: user.displayName ?? "",
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
          signOut: false,
          user: user,
          userjson: UserModel.fromEntity(
            UserEntity(
              uid: user.uid,
              phoneNumber: user.phoneNumber ?? "",
              firstName: user.displayName ?? "",
              fullName: user.displayName ?? "",
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

  Future<Either<Failure, void>> storeUserDataInFireStore(
      {required Map<String, dynamic> userjson,
      required User user,
      required String uid,
      bool signOut = true,
      bool checkVerified = true}) async {
    try {
      await databaseservice.setData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.usersCollection,
          docId: uid,
        ),
        data: userjson,
      );
      if (checkVerified == true) {
        await user.sendEmailVerification();
      }
      if (signOut == true) {
        await authService.signout();
      }
      return Right(null);
    } on CustomException catch (e, s) {
      ("$e\n$s");
      return Left(ServerFailure(message: e.message));
    } catch (e, s) {
      ("$e\n$s");
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(
    String? newPassword, {
    required UserEntity userEntity,
    required String currentPassword,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      Map<String, dynamic> userJson = UserModel.fromEntity(userEntity).toJson();
      if (user != null) {
        bool isValid =
            await authService.checkAccountPassword(password: currentPassword);
        if (isValid) {
          if (newPassword != null) {
            await authService.changePassword(password: newPassword);
          }
          if (userEntity.email != user.email) {
            await authService.changeEmail(email: userEntity.email);
          }
          final result = await storeUserDataInFireStore(
              user: user,
              userjson: userJson,
              uid: user.uid,
              signOut: false,
              checkVerified: false);

          if (result.isLeft()) {
            return result;
          } else {
            await storeUserLocally(userJson);
            return Right(null);
          }
        } else {
          return Left(ServerFailure(message: "كلمة المرور غير صحيحة"));
        }
      } else {
        return Left(ServerFailure(message: "المستخدم غير موجود"));
      }
    } on CustomException catch (e, s) {
      ("$e $s");
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      ("$e");
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await authService.resetPassword(email: email);
      return Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
