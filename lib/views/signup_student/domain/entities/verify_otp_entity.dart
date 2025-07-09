class VerifyOtpEntity {
  final String message;
  final bool emailVerified;
  final String userRole;

  const VerifyOtpEntity({
    required this.message,
    required this.emailVerified,
    required this.userRole,
  });
}
