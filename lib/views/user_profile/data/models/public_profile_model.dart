// public_profile_model.dart

import 'package:job_portal/views/user_profile/domain/entities/public_profile_entity.dart';

class PublicProfileModel extends PublicProfileEntity {
  const PublicProfileModel({
    required super.firstName,
    required super.lastName,
    required super.userType,
    required super.email,
    required super.language,
    required super.aboutus,
    required super.careerObjective,
  });

  factory PublicProfileModel.fromJson(Map<String, dynamic> json) {
    return PublicProfileModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userType: json['userType'] ?? '',
      email: json['email'] ?? '',
      language: json['language'] ?? '',
      aboutus: json['aboutus'] ?? '',
      careerObjective: json['careerObjective'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userType': userType,
      'email': email,
      'language': language,
      'aboutus': aboutus,
      'careerObjective': careerObjective,
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
      activity: (json['activity'] as List<dynamic>)
          .map((e) => ActivityModel.fromJson(e))
          .toList(),
      // experiences: List<String>.from(json['experiences'] ?? []),
      experiences: (json['experiences'] as List<dynamic>)
          .map((e) => ExperienceModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'publicProfile': (publicProfile as PublicProfileModel).toJson(),
      'skills': skills.map((e) => (e as SkillModel).toJson()).toList(),
      'activity': activity.map((e) => (e as ActivityModel).toJson()).toList(),
      'experiences':
          experiences.map((e) => (e as ExperienceModel).toJson()).toList(),
    };
  }
}

class SkillModel extends SkillEntity {
  const SkillModel({
    required super.domain,
    required super.subSkills,
    required super.authority,
    required super.certificateImages,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      domain: json['domain'] ?? '',
      subSkills: (json['subSkills'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      authority: (json['authority'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      certificateImages: (json['certificate_image'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
        'domain': domain,
        'subSkills': subSkills,
        'authority': authority,
        'certificate_image': certificateImages,
      };
}

class ActivityModel extends ActivityEntity {
  const ActivityModel({
    required super.caption,
    required super.image,
    required super.likeCount,
    required super.commentCount,
    required super.createdAt,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      caption: json['caption'] ?? '',
      image: json['image'] ?? '',
      likeCount: json['likeCount'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'caption': caption,
        'image': image,
        'likeCount': likeCount,
        'commentCount': commentCount,
        'createdAt': createdAt.toIso8601String(),
      };
}

class ExperienceModel extends ExperienceEntity {
  const ExperienceModel({
    super.companyRecruiterProfileId,
    required super.totalExperience,
    required super.currentJobRole,
    required super.currentCompany,
    required super.status,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      companyRecruiterProfileId: json['companyRecruiterProfileId'],
      totalExperience: json['totalExperience'] ?? '',
      currentJobRole: json['currentJobRole'] ?? '',
      currentCompany: json['currentCompany'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyRecruiterProfileId': companyRecruiterProfileId,
      'totalExperience': totalExperience,
      'currentJobRole': currentJobRole,
      'currentCompany': currentCompany,
      'status': status,
    };
  }
}
