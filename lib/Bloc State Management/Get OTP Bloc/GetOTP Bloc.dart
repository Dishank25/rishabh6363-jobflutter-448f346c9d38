import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Bloc%20State%20Management/Get%20OTP%20Bloc/GetOTP%20Event.dart';
import 'package:job_portal/Bloc%20State%20Management/Get%20OTP%20Bloc/GetOTP%20State.dart';
import 'package:job_portal/Data/Remote/API_Helper.dart';
import 'package:job_portal/Data/Remote/App_URLS.dart';

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
        if (response['success'] == true) {
          emit(GetOTPSuccessState(OTP: response['data']));
        } else {
          emit(GetOTPFailureState(
              ErrorMsg: response['message'] ?? 'Something went wrong'));
        }
      } catch (e) {
        emit(GetOTPFailureState(ErrorMsg: e.toString()));
      }
    }
    );
  }
}