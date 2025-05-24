abstract class OTPVerificationEvent {}

class VerifyEmailEvent extends OTPVerificationEvent {
  final String email;
  final String otp;

  VerifyEmailEvent({required this.email, required this.otp});
}