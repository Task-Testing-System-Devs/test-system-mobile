import 'dart:convert';

import 'package:hse_lyc_code_test_system/feature/profile/model/profile_model.dart';
import 'package:hse_lyc_code_test_system/service/api_service.dart';

class ProfilePresenter {
  final apiService = ApiService();

  Future<dynamic> getProfileInfo(String token) async {
    final response = await apiService.get(
      endpoint: '/profile/get-student-info',
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return response.statusCode;
    }
  }
}
