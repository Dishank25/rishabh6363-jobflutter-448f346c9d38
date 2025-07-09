class SpecializationListResponse {
  final List<String> specialization;

  SpecializationListResponse({required this.specialization});

  factory SpecializationListResponse.fromJson(List<dynamic> json) {
    return SpecializationListResponse(
      specialization: List<String>.from(json),
    );
  }

  List<dynamic> toJson() {
    return specialization;
  }
}
