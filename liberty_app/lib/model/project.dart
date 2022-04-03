class Project {
  String title;
  DateTime startDate;
  DateTime endDate;
  String? dayLeft;
  double progress;

  Project(
    this.title,
    this.startDate,
    this.endDate,
    this.progress, {
    this.dayLeft,
  });
}
