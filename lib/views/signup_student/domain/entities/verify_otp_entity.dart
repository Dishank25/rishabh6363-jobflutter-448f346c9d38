class VerifyOtpEntity {
  final String message;
  final String? token;
  final bool emailVerified;
  final UserEntity user;

  const VerifyOtpEntity({
    required this.message,
    required this.token,
    required this.emailVerified,
    required this.user,
  });
}

class UserEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String userRole;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.userRole,
  });
}
