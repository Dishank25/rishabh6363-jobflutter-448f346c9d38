import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Remote/API_Exceptions.dart';
import '../../Data/Remote/API_Helper.dart';
import '../../Data/Remote/App_URLS.dart';
//import '../../Models/Fetch User Data Model/Fetch User Data Model.dart';
import 'Fetch BasicDetails Event.dart';
import 'Fetch BasicDetails State.dart';
import 'Fetch User Data Model/Fetch User Data Model.dart';

class FetchUserBloc extends Bloc<FetchUserEvent, FetchUserState> {
  final ApiHelper apiHelper;

  FetchUserBloc({required this.apiHelper})
      : super(FetchUserInitialState()) {
    on<FetchUserDetailsEvent>((event, emit) async {
      emit(FetchUserLoadingState());
      try {
        final response = await apiHelper.postAPI(
          Url: AppUrls.GetUserDetails,
          mBodyParams: {"email": event.email},
        );

        print("API response: $response");

        final userData = response["user"]; // assuming response is a Map

        if (userData != null) {
          emit(UserDetailsLoadedState(userDetails: UserModel.fromJson(userData)));
        } else {
          emit(FetchUserFailedState(errorMsg: "No user data found in response"));
        }
      } catch (e) {
        String errorMessage = "An unexpected error occurred";
        if (e is APIExceptions) {
          errorMessage = e.ErrorMsg();
        } else {
          errorMessage = e.toString();
        }

        print("API error: $errorMessage");
        emit(FetchUserFailedState(errorMsg: errorMessage));
      }
    });
  }
}