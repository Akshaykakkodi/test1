import 'dart:developer';

import 'package:seclob/constants/constants.dart';
import 'package:seclob/helper/dio_client.dart';
import 'package:seclob/model/response_model.dart';

class ProfileRepository{
  DioClient dioClient=DioClient();

  Future <ResponseModel> loadProfileData()async{
    try{
   var response= await  dioClient.dioGet(AppConstants.apiEndpoint);
  log(response.toString());
   return ResponseModel.fromJson(response.data);
    }
    catch(e){
      log("error is${e.toString()}");
    throw e.toString();

    }
  }
}