import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Remote/API_Exceptions.dart';
import '../../Data/Remote/API_Helper.dart';
import '../../Data/Remote/App_URLS.dart';
import 'New Password Event.dart';
import 'New Password State.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ApiHelper apiHelper;

  ResetPasswordBloc({required this.apiHelper}) : super(ResetPasswordInitialState()) {
    on<ResetPasswordRequestEvent>((event, emit) async {
      emit(ResetPasswordLoadingState());

      try {
        final body = {
          "email": event.email,
          "otp": event.otp,
          "newPassword": event.newPassword,
        };

        final data = await apiHelper.postAPI(
          Url: AppUrls.ResetPasswordWithOtpURL,
          mBodyParams: body,
        );

        print("Reset Password API response: $data"); //

        if (data != null && (data["status"] == true || data["message"]?.toString().toLowerCase().contains("success") == true)) {
          emit(ResetPasswordSuccessState(message: data["message"] ?? "Password reset successful"));
        } else {
          final errorMsg = data != null && data["message"] != null
              ? data["message"].toString()
              : "Unknown error occurred";
          emit(ResetPasswordFailedState(errorMsg: errorMsg));
        }
      } catch (e) {
        String errorMessage = "An unexpected error occurred";
        if (e is APIExceptions) {
          errorMessage = e.ErrorMsg();
        } else if (e is Exception) {
          errorMessage = e.toString();
        }
        emit(ResetPasswordFailedState(errorMsg: errorMessage));
      }
    });
  }
}