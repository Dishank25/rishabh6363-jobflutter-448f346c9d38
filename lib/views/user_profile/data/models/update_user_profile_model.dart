import 'package:job_portal/views/user_profile/domain/entities/update_user_profile_entity.dart';

class UpdateUserProfileModel extends UpdateUserProfileEntity {
  UpdateUserProfileModel({
    required super.message,
    required super.userDetail,
  });

  factory UpdateUserProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserProfileModel(
      message: json['message'],
      userDetail: UpdateUserDetailModel.fromJson(json['userDetail']),
    );
  }
}

class UpdateUserDetailModel extends UpdateUserDetailEntity {
  UpdateUserDetailModel({
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
  });

  factory UpdateUserDetailModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserDetailModel(
      id: json['id'],
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      dob: json['dob'],
      aadhaarNumber: json['aadhaarNumber'],
      aadhaarCardFile: json['aadhaarCardFile'],
      isAadhaarVerified: json['isAadhaarVerified'],
      currentLocation: json['currentLocation'],
      gender: json['gender'],
      userType: json['userType'],
      standard: json['Standard'],
      course: json['course'],
      specialization: json['specialization'],
      college: json['college'],
      startYear: json['startYear'],
      endYear: json['endYear'],
      jobLocation: json['jobLocation'],
      salaryDetails: json['salaryDetails'],
      currentlyLookingFor: json['currentlyLookingFor'],
      workMode: json['workMode'],
      aboutUs: json['aboutus'],
      careerObjective: json['careerObjective'],
      resume: json['resume'],
      language: json['language'],
      isEmailVerified: json['isEmailVerified'],
      isPhoneVerified: json['isPhoneVerified'],
      isGstVerified: json['isGstVerified'],
      userProfilePic: json['userprofilepic'],
      termsAndCondition: json['termsAndCondition'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
