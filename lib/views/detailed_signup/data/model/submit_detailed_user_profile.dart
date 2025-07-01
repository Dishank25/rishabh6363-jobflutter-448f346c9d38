class SubmitDetailedUserProfile {
  final String message;
  final UserDetail? userDetail;

  SubmitDetailedUserProfile({
    required this.message,
    this.userDetail,
  });

  factory SubmitDetailedUserProfile.fromJson(Map<String, dynamic> json) {
    return SubmitDetailedUserProfile(
      message: json['message'] ?? '',
      userDetail: json.containsKey('userDetail') && json['userDetail'] != null
          ? UserDetail.fromJson(json['userDetail'])
          : null,
    );
  }
}

class UserDetail {
  final bool isAadhaarVerified;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final bool isGstVerified;
  final bool termsAndCondition;
  final int id;
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String dob;
  final String gender;
  final String userType;
  final String? course;
  final String? specialization;
  final String? startYear;
  final String? endYear;
  final DateTime updatedAt;
  final DateTime createdAt;

  UserDetail({
    required this.isAadhaarVerified,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.isGstVerified,
    required this.termsAndCondition,
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.dob,
    required this.gender,
    required this.userType,
    this.course,
    this.specialization,
    this.startYear,
    this.endYear,
    required this.updatedAt,
    required this.createdAt,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      isAadhaarVerified: json['isAadhaarVerified'] ?? false,
      isEmailVerified: json['isEmailVerified'] ?? false,
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      isGstVerified: json['isGstVerified'] ?? false,
      termsAndCondition: json['termsAndCondition'] ?? false,
      id: json['id'],
      userId: json['userId'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      userType: json['userType'] ?? '',
      course: json['course'],
      specialization: json['specialization'],
      startYear: json['startYear'],
      endYear: json['endYear'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
