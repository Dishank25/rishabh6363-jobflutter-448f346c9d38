// public_profile_model.dart

import 'package:job_portal/views/user_profile/domain/entities/public_profile_entity.dart';

class PublicProfileModel extends PublicProfileEntity {
  const PublicProfileModel({
    required super.firstName,
    required super.lastName,
    required super.userType,
    required super.email,
  });

  factory PublicProfileModel.fromJson(Map<String, dynamic> json) {
    return PublicProfileModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userType: json['userType'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userType': userType,
      'email': email,
    };
  }
}

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.publicProfile,
    required super.skills,
    required super.activity,
    required super.experiences,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      publicProfile: PublicProfileModel.fromJson(json['publicProfile']),
      skills: (json['skills'] as List<dynamic>)
          .map((e) => SkillModel.fromJson(e))
          .toList(),
      activity: List<String>.from(json['activity'] ?? []),
      experiences: List<String>.from(json['experiences'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'publicProfile': (publicProfile as PublicProfileModel).toJson(),
      'skills': skills,
      'activity': activity,
      'experiences': experiences,
    };
  }
}

class SkillModel extends SkillEntity {
  const SkillModel({required super.skill});

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(skill: json['skill'] ?? '');
  }

  Map<String, dynamic> toJson() => {
        'skill': skill,
      };
}
