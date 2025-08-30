import 'package:job_portal/views/user_profile/domain/entities/user_details_entity.dart';

class SchoolCollegeModel extends SchoolCollegeEntity {
  SchoolCollegeModel({required super.name, super.logoPic});

  factory SchoolCollegeModel.fromJson(Map<String, dynamic> json) {
    return SchoolCollegeModel(
      name: json['name'] ?? '',
      logoPic: json['logoPic'],
    );
  }
}

class CourseModel extends UDCourseEntity {
  CourseModel({required super.name});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(name: json['name'] ?? '');
  }
}

class SpecializationModel extends UDSpecializationEntity {
  SpecializationModel({required super.name});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(name: json['name'] ?? '');
  }
}

class SkillModel extends ProfileSkillEntity {
  SkillModel({
    required super.domain,
    required super.subSkills,
    required super.authority,
    required super.certificateImages,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      domain: json['domain'] ?? '',
      subSkills: List<String>.from(json['subSkills'] ?? []),
      authority: List<String>.from(json['authority'] ?? []),
      certificateImages: List<String>.from(json['certificate_image'] ?? []),
    );
  }
}

class CompanyRecruiterProfileModel extends CompanyRecruiterProfileEntity {
  CompanyRecruiterProfileModel({
    required super.companyName,
    super.logoUrl,
  });

  factory CompanyRecruiterProfileModel.fromJson(Map<String, dynamic> json) {
    return CompanyRecruiterProfileModel(
      companyName: json['companyName'] ?? '',
      logoUrl: json['logoUrl'],
    );
  }
}

class UserExperienceModel extends UserExperienceEntity {
  UserExperienceModel({
    required super.id,
    required super.userDetailId,
    super.companyRecruiterProfileId,
    super.startDate,
    super.endDate,
    super.currentJobRole,
    super.currentCompany,
    super.status,
    super.experienceCertificate,
    required super.createdAt,
    required super.updatedAt,
    super.companyRecruiterProfile,
  });

  factory UserExperienceModel.fromJson(Map<String, dynamic> json) {
    return UserExperienceModel(
      id: json['id'],
      userDetailId: json['userDetailId'],
      companyRecruiterProfileId: json['companyRecruiterProfileId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      currentJobRole: json['currentJobRole'],
      currentCompany: json['currentCompany'],
      status: json['status'],
      experienceCertificate: json['experienceCertificate'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      companyRecruiterProfile: json['companyRecruiterProfile'] != null
          ? CompanyRecruiterProfileModel.fromJson(
              json['companyRecruiterProfile'])
          : null,
    );
  }
}

class UserEducationModel extends UserEducationEntity {
  UserEducationModel({
    required super.id,
    required super.level,
    required super.schoolCollegeId,
    required super.boardOrUniversity,
    required super.courseId,
    required super.specializationId,
    required super.startYear,
    required super.endYear,
    required super.percentageOrCgpa,
    required super.educationCertificate,
    super.schoolCollege,
    super.course,
    super.specialization,
  });

  factory UserEducationModel.fromJson(Map<String, dynamic> json) {
    return UserEducationModel(
      id: json['id'],
      level: json['level'] ?? '',
      schoolCollegeId: json['schoolCollegeId'],
      boardOrUniversity: json['boardOrUniversity'] ?? '',
      courseId: json['courseId'],
      specializationId: json['specializationId'],
      startYear: json['startYear'] ?? '',
      endYear: json['endYear'] ?? '',
      percentageOrCgpa: json['percentageOrCgpa'] ?? '',
      educationCertificate: json['educationCertificate'] ?? '',
      schoolCollege: json['schoolCollege'] != null
          ? SchoolCollegeModel.fromJson(json['schoolCollege'])
          : null,
      course:
          json['course'] != null ? CourseModel.fromJson(json['course']) : null,
      specialization: json['specialization'] != null
          ? SpecializationModel.fromJson(json['specialization'])
          : null,
    );
  }
}

class UserDetailModel extends UserDetailEntity {
  UserDetailModel({
    required super.id,
    required super.userId,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.dob,
    required super.aadhaarNumber,
    required super.aadhaarCardFile,
    required super.isAadhaarVerified,
    required super.currentLocation,
    required super.gender,
    required super.userType,
    required super.jobLocation,
    required super.salaryDetails,
    required super.currentlyLookingFor,
    required super.workMode,
    required super.aboutUs,
    super.careerObjective,
    required super.resume,
    required super.language,
    required super.isEmailVerified,
    required super.isPhoneVerified,
    required super.isGstVerified,
    super.userProfilePic,
    required super.termsAndCondition,
    required super.createdAt,
    required super.updatedAt,
    required super.educations,
    required super.experiences,
    required super.skills,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    final user = json['userDetail'] ?? {};
    return UserDetailModel(
      id: user['id'],
      userId: user['userId'],
      firstName: user['firstName'],
      lastName: user['lastName'],
      email: user['email'],
      phone: user['phone'],
      dob: user['dob'],
      aadhaarNumber: user['aadhaarNumber'],
      aadhaarCardFile: user['aadhaarCardFile'],
      isAadhaarVerified: user['isAadhaarVerified'] ?? false,
      currentLocation: user['currentLocation'],
      gender: user['gender'],
      userType: user['userType'],
      jobLocation: user['jobLocation'],
      salaryDetails: user['salaryDetails'],
      currentlyLookingFor: user['currentlyLookingFor'],
      workMode: user['workMode'],
      aboutUs: user['aboutus'],
      careerObjective: user['careerObjective'],
      resume: user['resume'],
      language: user['language'],
      isEmailVerified: user['isEmailVerified'] ?? false,
      isPhoneVerified: user['isPhoneVerified'] ?? false,
      isGstVerified: user['isGstVerified'] ?? false,
      userProfilePic: user['userprofilepic'],
      termsAndCondition: user['termsAndCondition'] ?? false,
      createdAt: DateTime.parse(user['createdAt']),
      updatedAt: DateTime.parse(user['updatedAt']),
      educations: (user['educations'] as List<dynamic>?)
              ?.map((e) => UserEducationModel.fromJson(e))
              .toList() ??
          [],
      experiences: (user['experiences'] as List<dynamic>?)
              ?.map((e) => UserExperienceModel.fromJson(e))
              .toList() ??
          [],
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => SkillModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
