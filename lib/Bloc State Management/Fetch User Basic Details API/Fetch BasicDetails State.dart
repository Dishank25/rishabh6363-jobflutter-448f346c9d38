//import '../../Models/Fetch User Data Model/Fetch User Data Model.dart';
import 'Fetch User Data Model/Fetch User Data Model.dart';

abstract class FetchUserState {}

class FetchUserInitialState extends FetchUserState {}

class FetchUserLoadingState extends FetchUserState {}

class UserDetailsLoadedState extends FetchUserState {
  final UserModel userDetails;
  UserDetailsLoadedState({required this.userDetails});
}

class FetchUserFailedState extends FetchUserState {
  final String errorMsg;
  FetchUserFailedState({required this.errorMsg});
}