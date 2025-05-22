abstract class ForgotPasswordEvent {}

class SendForgotPasswordEmail extends ForgotPasswordEvent {
  final String email;

  SendForgotPasswordEmail({required this.email});
}