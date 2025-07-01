// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
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
  getIt.registerSingleton<StorageService>(getIt<firebasestorageservice>());
  getIt.registerSingleton<Databaseservice>(FirebaseFirestoreservice());
  getIt.registerSingleton<Pickerassetsservice>(Pickerassetsservice());
}
