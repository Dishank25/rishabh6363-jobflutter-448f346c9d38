import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Bloc%20State%20Management/Login%20User%20Bloc/UserLoginEvent.dart';
import 'package:job_portal/Bloc%20State%20Management/Login%20User%20Bloc/UserLoginState.dart';
import 'package:job_portal/Data/Remote/API_Helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/Remote/API_Exceptions.dart';
import '../../Data/Remote/App_URLS.dart';

class UserloginBloc extends Bloc<loginEvent, LoginState>{
  ApiHelper apiHelper;
  UserloginBloc({required this.apiHelper}):super(UserLoginInitialState()){
    on<UserLoginEvent>((event, emit)async{
      emit(UserLoginLoadingState());
      try {
        print("Register Request Body: ${event.bodyParams}");
        final data = await apiHelper.postAPI(
          Url: AppUrls.LoginURL,
          mBodyParams: event.bodyParams,
        );

        print("Register Response: $data");

        if (data != null && data["status"] == true) {
          if (data.containsKey('token')) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString("token", data['token']);
          }
         emit(UserLoginLoadedState(userLoginData: data));
        } else {
          final errorMsg = data != null && data["message"] != null
              ? data["message"].toString()
              : "Unknown error occurred";
          emit(UserLoginErrorState(errorMsg: errorMsg));
        }
      } catch (e) {
        String errorMessage = "An unexpected error occurred";
        if (e is APIExceptions) {
          errorMessage = e.ErrorMsg();
        } else if (e is Exception) {
          errorMessage = e.toString();
        }
        emit(UserLoginErrorState(errorMsg: errorMessage));
      }
    });
  }

    }

