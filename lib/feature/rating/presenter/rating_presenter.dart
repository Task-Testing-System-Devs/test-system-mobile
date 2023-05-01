import 'dart:convert';

import 'package:hse_lyc_code_test_system/feature/rating/model/rating_model.dart';
import 'package:hse_lyc_code_test_system/service/api_service.dart';

class RatingPresenter {
  final apiService = ApiService();

  Future<dynamic> getRatingByMarks(String token) async {
    final response = await apiService.get(
      endpoint: '/grade/by-marks',
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final rating = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      for (int i = 0; i < rating.length; i++) {
        rating[i] = RatingModel.fromJson(rating[i] as Map<String, dynamic>);
      }
      return rating;
    } else {
      return response.statusCode;
    }
  }

  Future<dynamic> getRatingByTasksAmount(String token) async {
    final response = await apiService.get(
      endpoint: '/grade/by-tasks-amount',
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final rating = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      for (int i = 0; i < rating.length; i++) {
        rating[i] = RatingModel.fromJson(rating[i] as Map<String, dynamic>);
      }
      return rating;
    } else {
      return response.statusCode;
    }
  }
}
