import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Remote/API_Helper.dart';
import '../../Data/Remote/App_URLS.dart';
import 'VerifyOTP Event.dart';
import 'VerifyOTP State.dart';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, VerifyOTPState> {
  final ApiHelper apiHelper;

  VerifyOTPBloc({required this.apiHelper}) : super(VerifyOTPInitialState()) {
    on<VerifyOTP>((event, emit) async {
      emit(VerifyOTPLoadingState());
      try {
        final response = await apiHelper.postAPI(
          Url: AppUrls.VerifyOTPURL,
          mBodyParams: {
            "phoneNumber": event.phoneNumber,
            "otp": event.otp,
          },
        );

        // Assuming API returns something like {"status": "success"} on success
         if (response != null && (response["status"] == "success" || (response["message"]?.toString().toLowerCase().contains("otp verified successfully") ?? false)))  {
          emit(VerifyOTPSuccessState(response));
        } else {
          // If response has an error message
          emit(VerifyOTPFailureState(response["message"] ?? "Invalid response"));
        }
      } catch (e) {
        emit(VerifyOTPFailureState(e.toString()));
      }
    });
  }
}