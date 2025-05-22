class Course {
  final String title;

  Course({required this.title});

  factory Course.fromJson(dynamic json) {
    return Course(title: json.toString());
  }
}