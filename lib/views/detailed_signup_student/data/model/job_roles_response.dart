// class JobRolesListResponse {
//   final List<String> jobRoles;

//   JobRolesListResponse({required this.jobRoles});

//   factory JobRolesListResponse.fromJson(List<dynamic> json) {
//     return JobRolesListResponse(
//       jobRoles: List<String>.from(json),
//     );
//   }

//   List<dynamic> toJson() {
//     return jobRoles;
//   }
// }

//above was original below is saved because of error
class JobRolesListResponse {
  final List<String> jobRoles;

  JobRolesListResponse({required this.jobRoles});

  // ✅ Updated: Accept Map<String, dynamic>, extract 'jobRoles' field
  factory JobRolesListResponse.fromJson(Map<String, dynamic> json) {
    final list = json['data'] as List<dynamic>?;
    if (list == null) {
      throw Exception('jobRoles field is missing or null');
    }
    return JobRolesListResponse(
      jobRoles: list.cast<String>(),
      // Or: List<String>.from(list),
    );
  }

  // ✅ Optional: Convert back to JSON
  Map<String, dynamic> toJson() {
    return {
      'jobRoles': jobRoles,
    };
  }
}
