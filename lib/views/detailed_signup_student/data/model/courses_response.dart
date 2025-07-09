class CoursesListResponse {
  final List<String> courses;

  CoursesListResponse({required this.courses});

  factory CoursesListResponse.fromJson(List<dynamic> json) {
    return CoursesListResponse(
      courses: List<String>.from(json),
    );
  }

  List<dynamic> toJson() {
    return courses;
  }
}
