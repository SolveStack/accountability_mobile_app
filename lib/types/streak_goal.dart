class StreakGoal {
  final String id;
  final String name;
  final String description;
  final int daysEngaged;
  final String published;

  StreakGoal(
      {required this.id,
      required this.name,
      required this.description, // TODO: Make this not required
      required this.daysEngaged,
      required this.published});

  factory StreakGoal.fromJson(Map<String, dynamic> json) {
    return StreakGoal(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      daysEngaged: json['days_engaged'],
      published: json['published'],
    );
  }
}
