import 'package:job_portal/views/signup_student/domain/entities/verify_otp_entity.dart';

class VerifyOtpResponse extends VerifyOtpEntity {
  const VerifyOtpResponse({
    required super.message,
    required super.token,
    required super.emailVerified,
    required super.user,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      message: json['message'] ?? '',
      token: json['token'],
      emailVerified: json['emailVerified'] ?? false,
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'emailVerified': emailVerified,
      'user': (user as UserModel).toJson(),
    };
  }
}

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.userRole,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      userRole: json['userRole'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'userRole': userRole,
    };
  }
}
