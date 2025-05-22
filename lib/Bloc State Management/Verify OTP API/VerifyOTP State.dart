abstract class VerifyOTPState{}

class VerifyOTPInitialState extends VerifyOTPState{}

class VerifyOTPLoadingState extends VerifyOTPState{}

class VerifyOTPSuccessState extends VerifyOTPState{
  final Map<String, dynamic> response;
  VerifyOTPSuccessState(this.response);
}

class VerifyOTPFailureState extends VerifyOTPState{
  final String error;
  VerifyOTPFailureState(this.error);
}