import 'dart:convert';
import 'dart:developer';

import 'package:hse_lyc_code_test_system/feature/contest/model/contest_model.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/service/api_service.dart';
import 'package:hse_lyc_code_test_system/service/ejudge_service.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';

class ContestPresenter {
  final _apiService = ApiService();
  final _ejudgeService = EjudgeService();

  Future<List<ContestModel>?> getContests(String token) async {
    final response = await _apiService.get(
      endpoint: '/contest/get-all',
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final contests = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      final finalContests = <ContestModel>[];

      for (int i = 0; i < contests.length; i++) {
        finalContests.add(ContestModel.fromJson(contests[i] as Map<String, dynamic>));
      }
      return finalContests;
    } else {
      return null;
    }
  }

  Future<void> addSentTask(SentTaskModel sentTaskModel) async {
    final token = SharedPreferencesService().token;
    log('${sentTaskModel.toJson()}');
    final response = await _apiService.post(
      endpoint: '/solutions/add',
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(sentTaskModel.toJson()),
    );

    log('${response.statusCode} : ${response.body}');
  }
}
