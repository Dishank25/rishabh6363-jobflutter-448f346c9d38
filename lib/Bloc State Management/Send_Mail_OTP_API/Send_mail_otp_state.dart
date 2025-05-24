abstract class SendOTPState {}

class SendOTPInitial extends SendOTPState {}

class SendOTPLoading extends SendOTPState {}

class SendOTPSuccess extends SendOTPState {
  final String message;

  SendOTPSuccess(this.message);
}

class SendOTPFailure extends SendOTPState {
  final String error;

  SendOTPFailure(this.error);
}