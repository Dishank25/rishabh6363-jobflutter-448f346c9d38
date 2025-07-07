class AllJobsEntity {
  final String jobProfile;
  final String companyName;
  final String logoUrl;
  final String hiringStatus;
  final String postedDaysAgo;
  final int matchPercentage;
  final String experience;
  final String salary;

  const AllJobsEntity({
    required this.jobProfile,
    required this.companyName,
    required this.logoUrl,
    required this.hiringStatus,
    required this.postedDaysAgo,
    required this.matchPercentage,
    required this.experience,
    required this.salary,
  });
}
