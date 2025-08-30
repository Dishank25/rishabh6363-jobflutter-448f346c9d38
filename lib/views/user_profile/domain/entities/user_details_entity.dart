class UserDetailEntity {
  final int id;
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String dob;
  final String? aadhaarNumber;
  final String? aadhaarCardFile;
  final bool isAadhaarVerified;
  final String? currentLocation;
  final String gender;
  final String userType;
  final String? jobLocation;
  final String? salaryDetails;
  final String? currentlyLookingFor;
  final String? workMode;
  final String? aboutUs;
  final String? careerObjective;
  final String? resume;
  final String? language;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final bool isGstVerified;
  final String? userProfilePic;
  final bool termsAndCondition;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<UserEducationEntity> educations;
  final List<UserExperienceEntity> experiences;
  final List<ProfileSkillEntity> skills;

  UserDetailEntity({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.dob,
    required this.aadhaarNumber,
    required this.aadhaarCardFile,
    required this.isAadhaarVerified,
    required this.currentLocation,
    required this.gender,
    required this.userType,
    required this.jobLocation,
    required this.salaryDetails,
    required this.currentlyLookingFor,
    required this.workMode,
    required this.aboutUs,
    this.careerObjective,
    required this.resume,
    required this.language,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.isGstVerified,
    this.userProfilePic,
    required this.termsAndCondition,
    required this.createdAt,
    required this.updatedAt,
    required this.educations,
    required this.experiences,
    required this.skills,
  });
}

class UserEducationEntity {
  final int id;
  final String level;
  final int schoolCollegeId;
  final String boardOrUniversity;
  final int courseId;
  final int specializationId;
  final String startYear;
  final String endYear;
  final String percentageOrCgpa;
  final String educationCertificate;
  final SchoolCollegeEntity? schoolCollege;
  final UDCourseEntity? course;
  final UDSpecializationEntity? specialization;

  UserEducationEntity({
    required this.id,
    required this.level,
    required this.schoolCollegeId,
    required this.boardOrUniversity,
    required this.courseId,
    required this.specializationId,
    required this.startYear,
    required this.endYear,
    required this.percentageOrCgpa,
    required this.educationCertificate,
    this.schoolCollege,
    this.course,
    this.specialization,
  });
}

class SchoolCollegeEntity {
  final String name;
  final String? logoPic;

  SchoolCollegeEntity({
    required this.name,
    this.logoPic,
  });
}

class UDCourseEntity {
  final String name;

  UDCourseEntity({required this.name});
}

class UDSpecializationEntity {
  final String name;

  UDSpecializationEntity({required this.name});
}

class ProfileSkillEntity {
  final String domain;
  final List<String> subSkills;
  final List<String> authority;
  final List<String> certificateImages;

  ProfileSkillEntity({
    required this.domain,
    required this.subSkills,
    required this.authority,
    required this.certificateImages,
  });
}

class CompanyRecruiterProfileEntity {
  final String companyName;
  final String? logoUrl;

  CompanyRecruiterProfileEntity({
    required this.companyName,
    this.logoUrl,
  });
}

class UserExperienceEntity {
  final int id;
  final int userDetailId;
  final int? companyRecruiterProfileId;
  final String? startDate;
  final String? endDate;
  final String? currentJobRole;
  final String? currentCompany;
  final String? status;
  final String? experienceCertificate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CompanyRecruiterProfileEntity? companyRecruiterProfile;

  UserExperienceEntity({
    required this.id,
    required this.userDetailId,
    this.companyRecruiterProfileId,
    this.startDate,
    this.endDate,
    this.currentJobRole,
    this.currentCompany,
    this.status,
    this.experienceCertificate,
    required this.createdAt,
    required this.updatedAt,
    this.companyRecruiterProfile,
  });
}
