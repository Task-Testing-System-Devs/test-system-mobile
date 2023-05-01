import 'package:hse_lyc_code_test_system/service/api_service.dart';

class SentTasksPresenter {
  final _apiService = ApiService();

  Future<dynamic> getAllSentTasks(String token) async {
    final response =
        await _apiService.get(endpoint: '/solutions/get-all', headers: <String, String>{
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return 'got solutions';
    } else if (response.statusCode == 400) {
      return 'empty';
    } else {
      return response.statusCode;
    }
  }
}
