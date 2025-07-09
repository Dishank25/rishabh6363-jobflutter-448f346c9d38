import 'package:job_portal/views/signup_student/domain/entities/verify_otp_entity.dart';

class VerifyOtpResponse extends VerifyOtpEntity {
  const VerifyOtpResponse({
    required super.message,
    required super.emailVerified,
    required super.userRole,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      message: json['message'] ?? '',
      emailVerified: json['emailVerified'] ?? false,
      userRole: json['userRole'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'emailVerified': emailVerified,
      'userRole': userRole,
    };
  }
}
