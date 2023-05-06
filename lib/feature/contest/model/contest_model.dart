class ContestModel {
  final int id;
  final String title;
  final DateTime startTime;
  final DateTime finishTime;

  ContestModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.finishTime,
  });

  factory ContestModel.fromJson(Map<String, dynamic> json) {
    return ContestModel(
      id: json['ejudge_id'],
      title: json['title'],
      startTime: DateTime.parse(json['start_time']),
      finishTime: DateTime.parse(json['finish_time']),
    );
  }
}
