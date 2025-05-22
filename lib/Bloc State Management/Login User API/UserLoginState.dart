abstract class LoginState{}

class UserLoginInitialState extends LoginState{}
class UserLoginLoadingState extends LoginState{}
class UserLoginLoadedState extends LoginState{
  Map<String, dynamic> userLoginData;
  UserLoginLoadedState({required this.userLoginData});
}
class UserLoginErrorState extends LoginState{
  String errorMsg;
  UserLoginErrorState({required this.errorMsg});
}