import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Data/Remote/API_Helper.dart';
import 'package:job_portal/Data/Remote/App_URLS.dart';

import 'GetOTP Event.dart';
import 'GetOTP State.dart';

class GetOTPBloc extends Bloc<GetOTPEvent, GetOTPState>{
  ApiHelper apiHelper;
  GetOTPBloc({required this.apiHelper}):super(GetOTPInitialState()){
    on<GetOTP>((event,emit)async {
      emit(GetOTPFetchingState());

      try {
        final response = await apiHelper.postAPI(
          Url: AppUrls.GetOTPURL,
          mBodyParams: {'phoneNumber': event.phoneNumber},

        );
        if (response != null && response.containsKey("otp")) {
          emit(GetOTPSuccessState(OTP: response));
        } else {
          emit(GetOTPFailureState(ErrorMsg: response["message"] ?? "Unknown error"));
        }
      } catch (e) {
        emit(GetOTPFailureState(ErrorMsg: e.toString()));
      }
    }
    );
  }
}