abstract class RegisterUserEvent{}
class RegisteredUserEvent extends RegisterUserEvent{
  Map<String, dynamic> bodyParams;
  RegisteredUserEvent({required this.bodyParams});
}