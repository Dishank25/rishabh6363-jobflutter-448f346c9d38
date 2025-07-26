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
  final String? standard;
  final String? course;
  final String? specialization;
  final String? college;
  final String? startYear;
  final String? endYear;
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
  final List<UserExperienceEntity> experiences;

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
    this.standard,
    this.course,
    this.specialization,
    this.college,
    this.startYear,
    this.endYear,
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
    required this.experiences,
  });
}

class UserExperienceEntity {
  final int id;
  final int userDetailId;
  final String? totalExperience;
  final String? currentJobRole;
  final String? currentCompany;
  final String? status;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserExperienceEntity({
    required this.id,
    required this.userDetailId,
    this.totalExperience,
    this.currentJobRole,
    this.currentCompany,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
