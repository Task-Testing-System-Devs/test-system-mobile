class ContestModel {
  final int id;
  final String title;
  final String startTime;
  final String finishTime;
  final bool isResolvable;
  final bool isMarkRated;
  final bool isTaskRated;

  ContestModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.finishTime,
    required this.isResolvable,
    required this.isMarkRated,
    required this.isTaskRated,
  });
}
