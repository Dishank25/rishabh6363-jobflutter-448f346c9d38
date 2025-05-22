abstract class GetOTPState{}

class GetOTPInitialState extends GetOTPState{}
class GetOTPFetchingState extends GetOTPState{}
class GetOTPSuccessState extends GetOTPState{
  final dynamic OTP;
  GetOTPSuccessState({required this.OTP});
}
class GetOTPFailureState extends GetOTPState{
  String ErrorMsg;
  GetOTPFailureState({required this.ErrorMsg});
}
