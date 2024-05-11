import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:seclob/model/response_model.dart';
import 'package:seclob/repository/profile_repository.dart';

class ProfileController extends ChangeNotifier {
  ProfileRepository profileRepository = ProfileRepository();
  Future<ResponseModel> loadProfileData() async {
    try {
      return await profileRepository.loadProfileData();
    } catch (e) {
       log(e.toString());
      throw e.toString();
    }
  }
}
