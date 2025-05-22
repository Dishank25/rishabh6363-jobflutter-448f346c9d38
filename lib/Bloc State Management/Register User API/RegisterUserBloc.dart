import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_portal/Data/Remote/API_Helper.dart';
import 'package:job_portal/Data/Remote/App_URLS.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/Remote/API_Exceptions.dart';
import 'RegisterUserEvent.dart';
import 'RegisterUserState.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final ApiHelper apiHelper;

  RegisterUserBloc({required this.apiHelper}) : super(RegisterUserInitialState()) {
    on<RegisteredUserEvent>((event, emit) async {
      emit(RegisterUserLoadingState());

      try {
        print("Register Request Body: ${event.bodyParams}");
        final data = await apiHelper.postAPI(
          Url: AppUrls.RegisterURL,
          mBodyParams: event.bodyParams,
        );

        print("Register Response: $data");

        if (data != null && data["message"] != null && data["message"].toString().contains("registered")) {
          // Optionally save token here if present
          emit(RegisterUserSuccessState());
        } else {
          final errorMsg = data != null && data["message"] != null
              ? data["message"].toString()
              : "Unknown error occurred";
          emit(RegisterUserFailedState(errorMsg: errorMsg));
        }

      } catch (e) {
        String errorMessage = "An unexpected error occurred";
        if (e is APIExceptions) {
          errorMessage = e.ErrorMsg();
        } else if (e is Exception) {
          errorMessage = e.toString();
        }
        emit(RegisterUserFailedState(errorMsg: errorMessage));
      }
    });
  }
}