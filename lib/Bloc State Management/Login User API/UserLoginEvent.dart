abstract class loginEvent{}

class UserLoginEvent extends loginEvent{
  Map<String, dynamic> bodyParams;
  UserLoginEvent({required this.bodyParams});
}