import 'dart:convert';

import 'package:in_egypt/Features/Auth/data/models/UserModel.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/core/services/Shared_preferences.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';

UserEntity getUserData() {
  String userJsonString = shared_preferences_Services.stringGetter(
      key: Backendkeys.storeUserLocaly);
  Map<String, dynamic> userJson = jsonDecode(userJsonString);
  UserEntity userEntity = UserModel.fromJson(userJson).toEntity();
  return userEntity;
}
