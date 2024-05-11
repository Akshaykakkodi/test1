import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:seclob/constants/constants.dart';

class DioClient {
   Dio dio = Dio();

   dioGet(String url) {
    try {
      dio.options.headers["Authorization"] = 'Bearer ${AppConstants.token}';
      var response = dio.get(url);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
