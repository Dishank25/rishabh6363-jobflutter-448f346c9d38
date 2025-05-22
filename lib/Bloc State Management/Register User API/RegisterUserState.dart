abstract class RegisterUserState{}

class RegisterUserInitialState extends RegisterUserState{}
class RegisterUserLoadingState extends RegisterUserState{}
class RegisterUserSuccessState extends RegisterUserState{}
class RegisterUserFailedState extends RegisterUserState{
  String errorMsg;
  RegisterUserFailedState({required this.errorMsg});
}