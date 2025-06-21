class CollegesListResponse {
  final List<String> colleges;

  CollegesListResponse({required this.colleges});

  factory CollegesListResponse.fromJson(List<dynamic> json) {
    return CollegesListResponse(
      colleges: List<String>.from(json),
    );
  }

  List<dynamic> toJson() {
    return colleges;
  }
}
