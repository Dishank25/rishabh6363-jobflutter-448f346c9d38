abstract class EmailVerificationState {}

class OTPInitial extends  EmailVerificationState{}

class OTPLoading extends  EmailVerificationState{}

class OTPSuccess extends EmailVerificationState{
  final String message;
  OTPSuccess(this.message);
}

class OTPFailure extends  EmailVerificationState{
  final String error;
  OTPFailure(this.error);
}