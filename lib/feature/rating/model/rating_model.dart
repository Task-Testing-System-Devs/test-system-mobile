import 'dart:convert';

class RatingModel {
  final int id;
  final String email;
  final String firstName;
  final String middleName;
  final String lastName;
  final String role;

  RatingModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.role,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    final userShortInfo = json['userShortInfo'];
    return RatingModel(
      id: json['id'],
      email: userShortInfo['email'],
      role: userShortInfo['role'],
      firstName: userShortInfo['firstName'],
      lastName: userShortInfo['lastName'],
      middleName: userShortInfo['middleName'],
    );
  }
}
