class AllJobsEntity {
  final int jobId;
  final String companyName;
  final String? logoUrl;
  final String jobRole;
  final List<SkillEntity> skills;
  final double matchPercentage;
  final String experience;
  final String salary;

  const AllJobsEntity({
    required this.jobId,
    required this.companyName,
    this.logoUrl,
    required this.jobRole,
    required this.skills,
    required this.matchPercentage,
    required this.experience,
    required this.salary,
  });
}

class SkillEntity {
  final int skillId;
  final String skillName;

  const SkillEntity({
    required this.skillId,
    required this.skillName,
  });
}
