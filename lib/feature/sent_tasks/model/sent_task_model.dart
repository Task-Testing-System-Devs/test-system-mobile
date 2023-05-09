class SentTaskModel {
  final String id;
  final String? taskName;
  final String? contestName;
  final String? code;
  final String? language;
  final String status;
  final String errorTest;
  final double? usedTime;
  final double? usedMemory;

  SentTaskModel({
    required this.id,
    this.taskName,
    this.contestName,
    this.code,
    this.language,
    required this.status,
    required this.errorTest,
    this.usedTime,
    this.usedMemory,
  });

  factory SentTaskModel.fromJson(Map<String, dynamic> json) {
    return SentTaskModel(
      id: '${json['id']}',
      code: json['code'],
      language: json['language'],
      status: json['status'],
      usedTime: json['used_time'],
      usedMemory: json['used_memory'],
      errorTest: json['error_test'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'language': language,
      'status': status,
      'used_time': 0.2,
      'used_memory': 2.8,
      'error_test': errorTest,
      'contest_name': contestName,
      'task_name': taskName,
    };
  }
}
