import 'dart:convert';

class RatingModel {
  final int id;
  final String email;
  final String role;

  RatingModel({
    required this.id,
    required this.email,
    required this.role,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    final userShortInfo = json['userShortInfo'];
    return RatingModel(
      id: json['id'],
      email: userShortInfo['email'],
      role: userShortInfo['role'],
    );
  }
}
