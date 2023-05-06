import 'dart:convert';

import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/service/api_service.dart';

class SentTasksPresenter {
  final _apiService = ApiService();

  Future<dynamic> getAllSentTasks(String token) async {
    final response = await _apiService.get(
      endpoint: '/solutions/get-all',
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    print(response.statusCode);
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
      print('returning');
      return <SentTaskModel>[];
    } else {
      return response.statusCode;
    }
  }
}
