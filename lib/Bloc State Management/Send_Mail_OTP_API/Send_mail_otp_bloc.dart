import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Data/Remote/App_URLS.dart';

import '../../Data/Remote/API_Helper.dart';
import 'Send_mail_otp_event.dart';
import 'Send_mail_otp_state.dart';

class SendOTPBloc extends Bloc<SendOTPEvent, SendOTPState> {
  final ApiHelper apiHelper;

  SendOTPBloc({required this.apiHelper}) : super(SendOTPInitial()) {
    on<TriggerSendOTPEvent>(_onSendOTP);
  }

  Future<void> _onSendOTP(
      TriggerSendOTPEvent event, Emitter<SendOTPState> emit) async {
    emit(SendOTPLoading());

    try {
      final response = await apiHelper.postAPI(
        Url: AppUrls.VerifyEmailOTPURL, // replace with your base URL
        mBodyParams: {
          "email": event.email,
        },
      );

      emit(SendOTPSuccess(response['message'] ?? "OTP sent successfully"));
    } catch (e) {
      emit(SendOTPFailure(e.toString()));
    }
  }
}