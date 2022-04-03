class Task {
  String title;
  List<Member> members;
  DateTime startDate;
  DateTime endDate;
  String? dayLeft;
  double progress;

  Task(
    this.title,
    this.members,
    this.startDate,
    this.endDate,
    this.progress, {
    this.dayLeft,
  });
}

class Member {
  String name;
  String image;

  Member(this.name, this.image);
}
