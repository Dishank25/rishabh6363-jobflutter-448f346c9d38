import 'package:job_portal/views/user_profile/domain/entities/user_details_entity.dart';

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
    super.standard,
    super.course,
    super.specialization,
    super.college,
    super.startYear,
    super.endYear,
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
    required super.experiences,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    final user = json['userDetail'];
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
      isAadhaarVerified: user['isAadhaarVerified'],
      currentLocation: user['currentLocation'],
      gender: user['gender'],
      userType: user['userType'],
      standard: user['Standard'],
      course: user['course'],
      specialization: user['specialization'],
      college: user['college'],
      startYear: user['startYear'],
      endYear: user['endYear'],
      jobLocation: user['jobLocation'],
      salaryDetails: user['salaryDetails'],
      currentlyLookingFor: user['currentlyLookingFor'],
      workMode: user['workMode'],
      aboutUs: user['aboutus'],
      careerObjective: user['careerObjective'],
      resume: user['resume'],
      language: user['language'],
      isEmailVerified: user['isEmailVerified'],
      isPhoneVerified: user['isPhoneVerified'],
      isGstVerified: user['isGstVerified'],
      userProfilePic: user['userprofilepic'],
      termsAndCondition: user['termsAndCondition'],
      createdAt: DateTime.parse(user['createdAt']),
      updatedAt: DateTime.parse(user['updatedAt']),
      // experiences: user['experiences'] ?? [],
      experiences: (user['experiences'] as List<dynamic>?)
              ?.map((e) => UserExperienceModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

// class UserExperienceModel extends UserExperienceEntity {
//   UserExperienceModel({
//     required super.id,
//     required super.userDetailId,
//     super.totalExperience,
//     super.currentJobRole,
//     super.currentCompany,
//     super.status,
//     required super.createdAt,
//     required super.updatedAt,
//   });

//   factory UserExperienceModel.fromJson(Map<String, dynamic> json) {
//     return UserExperienceModel(
//       id: json['id'],
//       userDetailId: json['userDetailId'],
//       totalExperience: json['totalExperience'],
//       currentJobRole: json['currentJobRole'],
//       currentCompany: json['currentCompany'],
//       status: json['status'],
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//     );
//   }
// }

class UserExperienceModel extends UserExperienceEntity {
  UserExperienceModel({
    required super.id,
    required super.userDetailId,
    super.companyRecruiterProfileId,
    super.startDate,
    super.endDate,
    super.totalExperience,
    super.currentJobRole,
    super.currentCompany,
    super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserExperienceModel.fromJson(Map<String, dynamic> json) {
    return UserExperienceModel(
      id: json['id'],
      userDetailId: json['userDetailId'],
      companyRecruiterProfileId: json['companyRecruiterProfileId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      totalExperience: json['totalExperience'],
      currentJobRole: json['currentJobRole'],
      currentCompany: json['currentCompany'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
