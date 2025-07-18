// public_profile_entity.dart
class PublicProfileEntity {
  final String firstName;
  final String lastName;
  final String userType;
  final String email;

  const PublicProfileEntity({
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.email,
  });
}

// user_profile_entity.dart
class UserProfileEntity {
  final PublicProfileEntity publicProfile;
  final List<SkillEntity> skills;
  final List<String> activity;
  final List<String> experiences;

  const UserProfileEntity({
    required this.publicProfile,
    required this.skills,
    required this.activity,
    required this.experiences,
  });
}

// skill_entity.dart
class SkillEntity {
  final String skill;

  const SkillEntity({required this.skill});
}
