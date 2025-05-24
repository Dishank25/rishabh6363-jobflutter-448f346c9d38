import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Data/Remote/App_URLS.dart';

import '../../Data/Remote/API_Helper.dart';
import 'Verify_Email_Event.dart';
import 'Verify Email State.dart';

class EmailVerificationBloc extends Bloc<OTPVerificationEvent,  EmailVerificationState> {
  final ApiHelper apiHelper;

  EmailVerificationBloc({required this.apiHelper}) : super(OTPInitial()) {
    on<VerifyEmailEvent>(_onVerifyOTP);
  }

  Future<void> _onVerifyOTP(VerifyEmailEvent event, Emitter< EmailVerificationState> emit) async {
    emit(OTPLoading());

    try {
      final response = await apiHelper.postAPI(
        Url:AppUrls.VerifyEmailURL , // Replace with actual base URL
        mBodyParams: {
          "email": event.email,
          "otp": event.otp,
        },
      );

      // Assuming API returns a JSON with a 'message' field on success
      emit(OTPSuccess(response['message'] ?? "OTP Verified Successfully"));
    } catch (e) {
      emit(OTPFailure(e.toString()));
    }
  }
}