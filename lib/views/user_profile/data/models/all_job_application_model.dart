import 'package:job_portal/views/user_profile/domain/entities/all_job_applications_entity.dart';

class AllJobApplicationsModel extends AllJobApplicationsEntity {
  AllJobApplicationsModel({required List<JobApplicationModel> applications})
      : super(applications: applications);

  factory AllJobApplicationsModel.fromJson(Map<String, dynamic> json) {
    return AllJobApplicationsModel(
      applications: (json['applications'] as List)
          .map((e) => JobApplicationModel.fromJson(e))
          .toList(),
    );
  }
}

class JobApplicationModel extends JobApplicationEntity {
  JobApplicationModel({
    required int applicationId,
    required String companyName,
    required String jobProfile,
    required String skillsRequired,
    required int? numberOfOpenings,
    required String status,
    required int applicantCount,
    required DateTime applyTime,
    required ApplicationDetailsModel applicationDetails,
  }) : super(
          applicationId: applicationId,
          companyName: companyName,
          jobProfile: jobProfile,
          skillsRequired: skillsRequired,
          numberOfOpenings: numberOfOpenings,
          status: status,
          applicantCount: applicantCount,
          applyTime: applyTime,
          applicationDetails: applicationDetails,
        );

  factory JobApplicationModel.fromJson(Map<String, dynamic> json) {
    return JobApplicationModel(
      applicationId: json['applicationId'],
      companyName: json['companyName'],
      jobProfile: json['jobProfile'] ?? '',
      skillsRequired: json['skillsRequired'] ?? '',
      numberOfOpenings: json['numberOfOpenings'],
      status: json['status'],
      applicantCount: json['applicantCount'],
      applyTime: DateTime.parse(json['applyTime']),
      applicationDetails:
          ApplicationDetailsModel.fromJson(json['applicationDetails']),
    );
  }
}

class ApplicationDetailsModel extends ApplicationDetailsEntity {
  ApplicationDetailsModel({
    required String whyShouldWeHireYou,
    required String confirmAvailability,
    required String project,
    required String githubLink,
    required String portfolioLink,
    required String education,
    required String name,
    required String location,
    required String experience,
    required String skills,
    required String language,
    required String resume,
    required String email,
    required String phoneNumber,
  }) : super(
          whyShouldWeHireYou: whyShouldWeHireYou,
          confirmAvailability: confirmAvailability,
          project: project,
          githubLink: githubLink,
          portfolioLink: portfolioLink,
          education: education,
          name: name,
          location: location,
          experience: experience,
          skills: skills,
          language: language,
          resume: resume,
          email: email,
          phoneNumber: phoneNumber,
        );

  factory ApplicationDetailsModel.fromJson(Map<String, dynamic> json) {
    return ApplicationDetailsModel(
      whyShouldWeHireYou: json['whyShouldWeHireYou'],
      confirmAvailability: json['confirmAvailability'],
      project: json['project'],
      githubLink: json['githubLink'],
      portfolioLink: json['portfolioLink'],
      education: json['education'],
      name: json['name'],
      location: json['location'],
      experience: json['experience'],
      skills: json['skills'],
      language: json['language'],
      resume: json['resume'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
