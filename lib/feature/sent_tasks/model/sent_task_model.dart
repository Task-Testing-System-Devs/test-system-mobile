class SentTaskModel {
  final String id;
  final double time;
  final double memory;
  final String status;
  final String errorOnTest;

  SentTaskModel({
    required this.id,
    this.time = 0,
    this.memory = 0,
    required this.status,
    required this.errorOnTest,
  });
}
