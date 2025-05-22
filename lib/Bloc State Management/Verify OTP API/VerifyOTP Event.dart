abstract class VerifyOTPEvent{}

class VerifyOTP extends VerifyOTPEvent{
  final String phoneNumber;
  final String otp;
  VerifyOTP({required this.phoneNumber,required this.otp});
}