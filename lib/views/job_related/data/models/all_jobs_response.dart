import 'package:job_portal/views/job_related/domain/entities/all_jobs_entity.dart';

class AllJobsResponse {
  final List<JobModel> data;

  AllJobsResponse({required this.data});

  factory AllJobsResponse.fromJson(Map<String, dynamic> json) {
    return AllJobsResponse(
      data: List<JobModel>.from(
          json['data'].map((item) => JobModel.fromJson(item))),
    );
  }
}

class JobModel extends AllJobsEntity {
  JobModel({
    required String jobProfile,
    required String companyName,
    required String logoUrl,
    required String hiringStatus,
    required String postedDaysAgo,
    required int matchPercentage,
    required String experience,
    required String salary,
  }) : super(
          jobProfile: jobProfile,
          companyName: companyName,
          logoUrl: logoUrl,
          hiringStatus: hiringStatus,
          postedDaysAgo: postedDaysAgo,
          matchPercentage: matchPercentage,
          experience: experience,
          salary: salary,
        );

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      jobProfile: json['jobProfile'],
      companyName: json['companyName'],
      logoUrl: json['logoUrl'],
      hiringStatus: json['hiringStatus'],
      postedDaysAgo: json['postedDaysAgo'],
      matchPercentage: json['matchPercentage'],
      experience: json['experience'],
      salary: json['salary'],
    );
  }
}
