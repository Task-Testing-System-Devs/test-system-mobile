import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hse_lyc_code_test_system/feature/contest/model/task_model.dart';
import 'package:hse_lyc_code_test_system/shared/programming_language.dart';
import 'package:http/http.dart' as http;

class EjudgeService {
  static const _url = 'http://37.252.0.155:3000';

  /// Получает список заданий по id контеста.
  // TODO(kateR): добавить id контеста
  Future<List<TaskModel>> parseTasks(int contestId) async {
    final authResponse = await http.post(
      Uri.parse('$_url/auth'),
      headers: <String, String>{
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'login': 'ejudge',
        'password': 'ejudge',
        'contestID': contestId,
      }),
    );
    print(authResponse.body);
    final response = await http.get(Uri.parse('$_url/parseTasks'));
    print(response.body);
    final body = jsonDecode(response.body)['message'];

    if (body is String) {
      return <TaskModel>[];
    } else {
      final tasks = <TaskModel>[];
      for (final task in body as List<dynamic>) {
        tasks.add(TaskModel.fromJson(task as Map<String, dynamic>));
      }
      return tasks;
    }
  }

  Future<void> sendTask(String base64code, int taskId, ProgrammingLanguage language) async {
    final response = await http.post(
      Uri.parse('$_url/handleSolution'),
      headers: <String, String>{
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'solutionFileBase64': base64code,
          'taskID': '$taskId',
          'language': language.value,
        },
      ),
    );
    log('${jsonEncode(
      {
        'solutionFileBase64': base64code,
        'taskID': '$taskId',
        'language': language.value,
      },
    )}');
    print(response.body);
  }

  Future<Map<String, dynamic>> getResult() async {
    final response = await http.get(
      Uri.parse('$_url/getResult'),
    );

    final body = jsonDecode(response.body);

    if (body is String) {
      return <String, dynamic>{};
    } else {
      return body as Map<String, dynamic>;
    }
  }
}
