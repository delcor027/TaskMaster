class TaskModel {
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String category;

  TaskModel({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.category,
  });
}
