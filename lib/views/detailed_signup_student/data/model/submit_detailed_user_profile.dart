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
  final bool is_email_verified;
  final bool is_phone_verified;
  final bool is_gst_verified;
  final bool terms_and_condition;
  final int id;
  final int user_id;
  final String first_name;
  final String last_name;
  final String email;
  final String phone;
  final String dob;
  final String gender;
  final String user_type;

  final int? course_id;
  final int? specialization_id;
  final String? college_name;
  final String? start_year;
  final String? end_year;

  final DateTime updated_at;
  final DateTime created_at;

  UserDetail({
    required this.isAadhaarVerified,
    required this.is_email_verified,
    required this.is_phone_verified,
    required this.is_gst_verified,
    required this.terms_and_condition,
    required this.id,
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.gender,
    required this.user_type,
    this.course_id,
    this.specialization_id,
    this.college_name,
    this.start_year,
    this.end_year,
    required this.updated_at,
    required this.created_at,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      isAadhaarVerified: json['is_aadhaar_verified'] ?? false,
      is_email_verified: json['is_email_verified'] ?? false,
      is_phone_verified: json['is_phone_verified'] ?? false,
      is_gst_verified: json['is_gst_verified'] ?? false,
      terms_and_condition: json['terms_and_condition'] ?? false,
      id: json['id'],
      user_id: json['user_id'],
      first_name: json['first_name'] ?? '',
      last_name: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      user_type: json['user_type'] ?? '',

      course_id: json['course_id'],
      specialization_id: json['specialization_id'],
      college_name: json['college_name'],
      start_year: json['start_year'],
      end_year: json['end_year'],

      updated_at: DateTime.parse(json['updated_at']),
      created_at: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'phone': phone,
      'dob': dob,
      'gender': gender,
      'user_type': user_type,
      'course_id': course_id,
      'specialization_id': specialization_id,
      'college_name': college_name,
      'start_year': start_year,
      'end_year': end_year,
      'currently_looking_for': null,
      'work_mode': null,
    };
  }
}
