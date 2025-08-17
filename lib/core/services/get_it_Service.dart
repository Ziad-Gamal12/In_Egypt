// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:in_egypt/Features/Auth/data/Repos/AuthRepoImpl.dart';
import 'package:in_egypt/Features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt/Features/Book/data/repos/PaymentRepo/PaymentRepoImpl.dart';
import 'package:in_egypt/Features/Book/domain/repos/PaymentRepo/PaymentRepo.dart';
import 'package:in_egypt/Features/Home/data/Repos/PlacesRepoImpl.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/services/DioService.dart';
import 'package:in_egypt/core/services/FirebaseAuth_Service.dart';
import 'package:in_egypt/core/services/Firebase_FirestoreService.dart';
import 'package:in_egypt/core/services/PickerAssetsService.dart';
import 'package:in_egypt/core/services/StorageService.dart';
import 'package:in_egypt/core/services/firebaseStorageService.dart';

final getIt = GetIt.instance;

void setup_Getit() {
  getIt.registerSingleton<firebaseAuthService>(firebaseAuthService());
  getIt.registerSingleton<firebasestorageservice>(
    firebasestorageservice(pickerassetsservice: Pickerassetsservice()),
  );
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioService>(DioService(
    dio: getIt<Dio>(),
  ));
  getIt.registerSingleton<StorageService>(getIt<firebasestorageservice>());
  getIt.registerSingleton<Databaseservice>(FirebaseFirestoreservice());
  getIt.registerSingleton<Pickerassetsservice>(Pickerassetsservice());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authService: getIt<firebaseAuthService>(),
      databaseservice: getIt<Databaseservice>(),
    ),
  );
  getIt.registerSingleton<PlacesRepo>(
      PlacesRepoImpl(databaseservice: getIt<Databaseservice>()));
  getIt.registerSingleton<PaymentRepo>(PaymentRepoImpl(
    dioService: getIt<DioService>(),
  ));
}
