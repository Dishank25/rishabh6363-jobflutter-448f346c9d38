import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/Data/Remote/App_URLS.dart';
import 'package:http/http.dart' as http;

import 'Forget Password OTP Event.dart';
import 'Forget Password OTP State.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<SendForgotPasswordEmail>(_onSendForgotPasswordEmail);
  }

  Future<void> _onSendForgotPasswordEmail(
      SendForgotPasswordEmail event,
      Emitter<ForgotPasswordState> emit,
      ) async {
    emit(ForgotPasswordLoading());

    try {
      print("Sending forgot password request to: ${AppUrls.ForgetPasswordURL}"); // ✅ Debug
      print("With Email: ${event.email}"); // ✅ Debug

      final response = await http.post(
        Uri.parse(AppUrls.ForgetPasswordURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': event.email}),
      );

      print("Response status: ${response.statusCode}"); // ✅ Debug
      print("Response body: ${response.body}"); // ✅ Debug

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        emit(ForgotPasswordSuccess(responseData['message'] ?? "Check your email for reset OTP"));
      } else {
        final errorData = jsonDecode(response.body);
        emit(ForgotPasswordFailure(errorData['message'] ?? "Unknown error"));
      }
    } catch (e) {
      print("Error during forgot password API: $e"); // ✅ Debug
      emit(ForgotPasswordFailure("Failed to send reset email: $e"));
    }
  }
}