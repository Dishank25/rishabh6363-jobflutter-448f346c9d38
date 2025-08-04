class AllJobApplicationsEntity {
  final List<JobApplicationEntity> applications;

  AllJobApplicationsEntity({required this.applications});
}

class JobApplicationEntity {
  final int applicationId;
  final String companyName;
  final String jobProfile;
  final String skillsRequired;
  final int? numberOfOpenings;
  final String status;
  final int applicantCount;
  final DateTime applyTime;
  final ApplicationDetailsEntity applicationDetails;

  JobApplicationEntity({
    required this.applicationId,
    required this.companyName,
    required this.jobProfile,
    required this.skillsRequired,
    required this.numberOfOpenings,
    required this.status,
    required this.applicantCount,
    required this.applyTime,
    required this.applicationDetails,
  });
}

class ApplicationDetailsEntity {
  final String whyShouldWeHireYou;
  final String confirmAvailability;
  final String project;
  final String githubLink;
  final String portfolioLink;
  final String education;
  final String name;
  final String location;
  final String experience;
  final String skills;
  final String language;
  final String resume;
  final String email;
  final String phoneNumber;

  ApplicationDetailsEntity({
    required this.whyShouldWeHireYou,
    required this.confirmAvailability,
    required this.project,
    required this.githubLink,
    required this.portfolioLink,
    required this.education,
    required this.name,
    required this.location,
    required this.experience,
    required this.skills,
    required this.language,
    required this.resume,
    required this.email,
    required this.phoneNumber,
  });
}
