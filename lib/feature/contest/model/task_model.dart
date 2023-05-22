class TaskModel {
  final int id;
  final String timeLimit;
  final String realTimeLimit;
  final String memoryLimit;
  final String title;
  final String description;
  final List<String> inputExamples;
  final List<String> outputExamples;

  TaskModel({
    required this.id,
    required this.timeLimit,
    required this.realTimeLimit,
    required this.memoryLimit,
    required this.title,
    required this.description,
    required this.inputExamples,
    required this.outputExamples,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: int.parse(json['probId']),
      timeLimit: json['timeLimit'],
      realTimeLimit: json['realTimeLimit'],
      memoryLimit: json['memoryLimit'],
      title: json['title'],
      description: json['description'],
      inputExamples: <String>[...json['inputExamples']],
      outputExamples: <String>[...json['outputExamples']],
    );
  }
}
