class TaskModel {
  final int id;
  final String timeLimit;
  final String realTimeLimit;
  final String memoryLimit;
  final String title;
  final String description;

  TaskModel({
    required this.id,
    required this.timeLimit,
    required this.realTimeLimit,
    required this.memoryLimit,
    required this.title,
    required this.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: int.parse(json['probId']),
      timeLimit: json['timeLimit'],
      realTimeLimit: json['realTimeLimit'],
      memoryLimit: json['memoryLimit'],
      title: json['title'],
      description: json['description'],
    );
  }
}
