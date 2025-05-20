abstract class GetOTPEvent{}

class GetOTP extends GetOTPEvent{
  final String phoneNumber;

  GetOTP(this.phoneNumber);
}