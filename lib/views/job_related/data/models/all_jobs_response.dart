import 'package:job_portal/views/job_related/domain/entities/all_jobs_entity.dart';

class AllJobsResponse {
  final List<JobModel> data;

  AllJobsResponse({required this.data});

  factory AllJobsResponse.fromJson(Map<String, dynamic> json) {
    return AllJobsResponse(
      data: (json['data'] as List<dynamic>? ?? [])
          .map((item) => JobModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class JobModel extends AllJobsEntity {
  JobModel({
    required super.jobId,
    required super.companyName,
    super.logoUrl,
    required super.jobRole,
    required super.skills,
    required super.matchPercentage,
    required super.experience,
    required super.salary,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      jobId: json['jobId'] ?? 0,
      companyName: json['companyName'] ?? '',
      logoUrl: json['logoUrl'],
      jobRole: json['jobRole'] ?? '',
      skills: (json['skills'] as List<dynamic>? ?? [])
          .map((skill) => SkillModel.fromJson(skill as Map<String, dynamic>))
          .toList(),
      matchPercentage: (json['matchPercentage'] is int)
          ? (json['matchPercentage'] as int).toDouble()
          : (json['matchPercentage'] ?? 0.0),
      experience: json['experience'] ?? '',
      salary: json['salary'] ?? '',
    );
  }
}

class SkillModel extends SkillEntity {
  SkillModel({
    required super.skillId,
    required super.skillName,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      skillId: json['skill_id'] ?? 0,
      skillName: json['skill_name'] ?? '',
    );
  }
}
