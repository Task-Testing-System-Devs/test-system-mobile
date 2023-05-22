import 'dart:convert';

import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/service/api_service.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';
import 'package:http/http.dart';

class SentTasksPresenter {
  final _apiService = ApiService();
  final _sharedPreferencesService = SharedPreferencesService();

  Future<dynamic> getAllSentTasks(String token) async {
    Response response;
    if (_sharedPreferencesService.role == 'teacher') {
      response = await _apiService.get(
        endpoint: '/solutions/get-all',
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    } else {
      response = await _apiService.get(
        endpoint: '/solutions/get-all-user',
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    }

    if (response.statusCode == 200) {
      List<SentTaskModel> sentTasks = [];
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      if (body is List<dynamic>) {
        for (final sentTask in body) {
          sentTasks.add(SentTaskModel.fromJson(sentTask as Map<String, dynamic>));
        }
      }
      return sentTasks;
    } else if (response.statusCode == 400) {
      return <SentTaskModel>[];
    } else {
      return response.statusCode;
    }
  }
}
