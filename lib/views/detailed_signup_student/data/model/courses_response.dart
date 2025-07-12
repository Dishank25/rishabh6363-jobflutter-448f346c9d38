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

class LocationsListResponse {
  final List<String> locations;

  LocationsListResponse({required this.locations});

  factory LocationsListResponse.fromJson(List<dynamic> json) {
    return LocationsListResponse(
      locations: List<String>.from(json),
    );
  }

  List<dynamic> toJson() {
    return locations;
  }
}
