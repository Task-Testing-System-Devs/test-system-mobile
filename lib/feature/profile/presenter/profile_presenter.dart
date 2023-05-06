import 'dart:convert';

import 'package:hse_lyc_code_test_system/feature/profile/model/profile_model.dart';
import 'package:hse_lyc_code_test_system/service/api_service.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';
import 'package:http/http.dart';

class ProfilePresenter {
  final _apiService = ApiService();
  final _sharedPreferencesService = SharedPreferencesService();

  Future<dynamic> getProfileInfo(String token) async {
    Response response;

    if (_sharedPreferencesService.role == 'teacher') {
      response = await _apiService.get(
        endpoint: '/profile/get-teacher-info',
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    } else {
      response = await _apiService.get(
        endpoint: '/profile/get-student-info',
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    }

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return response.statusCode;
    }
  }
}
