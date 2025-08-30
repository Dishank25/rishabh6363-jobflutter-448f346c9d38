// public_profile_entity.dart
class PublicProfileEntity {
  final String firstName;
  final String lastName;
  final String userType;
  final String email;
  final String language;
  final String aboutus;
  final String careerObjective;

  const PublicProfileEntity({
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.email,
    required this.language,
    required this.aboutus,
    required this.careerObjective,
  });
}

// activity_entity.dart
class ActivityEntity {
  final String caption;
  final String image;
  final int likeCount;
  final int commentCount;
  final DateTime createdAt;

  const ActivityEntity({
    required this.caption,
    required this.image,
    required this.likeCount,
    required this.commentCount,
    required this.createdAt,
  });
}

class UserProfileEntity {
  final PublicProfileEntity publicProfile;
  final List<SkillEntity> skills;
  final List<ActivityEntity> activity;
  final List<ExperienceEntity> experiences; // updated from List<String>

  const UserProfileEntity({
    required this.publicProfile,
    required this.skills,
    required this.activity,
    required this.experiences,
  });
}

// skill_entity.dart
class SkillEntity {
  final String domain;
  final List<String> subSkills;
  final List<String> authority;
  final List<String> certificateImages;

  const SkillEntity({
    required this.domain,
    required this.subSkills,
    required this.authority,
    required this.certificateImages,
  });
}

class ExperienceEntity {
  final String? companyRecruiterProfileId;
  final String totalExperience;
  final String currentJobRole;
  final String currentCompany;
  final String status;

  const ExperienceEntity({
    this.companyRecruiterProfileId,
    required this.totalExperience,
    required this.currentJobRole,
    required this.currentCompany,
    required this.status,
  });
}
