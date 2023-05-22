class ProfileModel {
  final int id;
  final String firstName;
  final String lastName;
  final String middleName;
  final String email;
  final String? department;
  final String? group;

  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.email,
    this.department,
    this.group,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      middleName: json['middle_name'],
      email: json['email'],
      department: json['department'],
      group: json['group'],
    );
  }
}
