abstract class SendOTPEvent {}

class TriggerSendOTPEvent extends SendOTPEvent {
  final String email;

  TriggerSendOTPEvent({required this.email});
}