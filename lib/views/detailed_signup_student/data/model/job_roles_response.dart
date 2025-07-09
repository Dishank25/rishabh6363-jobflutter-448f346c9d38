class JobRolesListResponse {
  final List<String> jobRoles;

  JobRolesListResponse({required this.jobRoles});

  factory JobRolesListResponse.fromJson(List<dynamic> json) {
    return JobRolesListResponse(
      jobRoles: List<String>.from(json),
    );
  }

  List<dynamic> toJson() {
    return jobRoles;
  }
}
