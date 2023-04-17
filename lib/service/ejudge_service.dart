import 'dart:convert';

import 'package:hse_lyc_code_test_system/feature/contest/model/task_model.dart';
import 'package:http/http.dart' as http;

class EjudgeService {
  static const _url = 'http://37.252.0.155:3000';

  /// Получает список заданий по id контеста.
  // TODO(kateR): добавить id контеста
  Future<List<TaskModel>> parseTasks() async {
    final authResponse = await http.post(
      Uri.parse('$_url/auth'),
      headers: <String, String>{
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'login': 'ejudge',
        'password': 'ejudge',
        'contestID': 1,
      }),
    );
    print(authResponse.body);
    final response = await http.get(Uri.parse('$_url/parseTasks'));
    final body = jsonDecode(response.body)['message'] as List<dynamic>;
    print(body);

    final tasks = <TaskModel>[];
    for (final task in body) {
      tasks.add(TaskModel.fromJson(task as Map<String, dynamic>));
    }

    return tasks;
  }
}
