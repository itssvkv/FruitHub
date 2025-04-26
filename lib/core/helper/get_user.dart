import 'dart:convert';

import 'package:fruit_app/core/constants.dart';
import 'package:fruit_app/core/services/shared_preferences_service.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entity/user_entity.dart';

UserEntity getUser() {
  var jsonString = jsonDecode(SharedPreferencesService.getValue(kUserData, ''));
  return UserModel.fromJson(jsonString);
}
