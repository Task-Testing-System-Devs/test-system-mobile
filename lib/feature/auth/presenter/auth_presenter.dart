import 'dart:convert';

import 'package:hse_lyc_code_test_system/feature/auth/model/auth_model.dart';
import 'package:hse_lyc_code_test_system/service/api_service.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';

class AuthPresenter {
  final apiService = ApiService();
  final sharedPreferencesService = SharedPreferencesService();

  Future<dynamic> login(AuthModel authModel) async {
    final response = await apiService.post(
      endpoint: '/auth/login',
      body: json.encode(
        <String, dynamic>{
          'email': authModel.email,
          'password': authModel.password,
        },
      ),
    );
    if (response.statusCode == 200) {
      sharedPreferencesService.token = response.body;
      return response.body;
    } else {
      return response.statusCode;
    }
  }
}
