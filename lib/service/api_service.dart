import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hse_lyc_code_test_system/feature/auth/model/auth_model.dart';

class ApiService {
  static const _url = 'http://37.252.0.155:8080/api';

  Future<http.Response> get({required String endpoint, Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$_url$endpoint'),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> post({
    required String endpoint,
    Map<String, String> headers = const <String, String>{
      'Content-Type': 'application/json',
    },
    dynamic body,
  }) async {
    final response = await http.post(
      Uri.parse('$_url$endpoint'),
      headers: headers,
      body: body,
    );
    return response;
  }
}
