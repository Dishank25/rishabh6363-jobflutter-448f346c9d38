import 'dart:developer' as developer show log;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/detailed_signup/domain/usecases/detailed_signup_usecase.dart';
import 'package:job_portal/views/signup/domain/usecase/signup_usecase.dart';
import 'package:job_portal/views/signup/presentation/bloc/remote_signup_event.dart';
import 'package:job_portal/views/signup/presentation/bloc/remote_signup_state.dart';

class RemoteSignupBloc extends Bloc<RemoteSignupEvent, RemoteSignupState> {
  final SignupUsecase _signupUsecase;
  // final DetailedSignupUsecase _detailedSignupUsecase;

  RemoteSignupBloc(
    this._signupUsecase,
    // this._detailedSignupUsecase
  ) : super(const RemoteSignupInitial()) {
    on<RemoteSignupData>(_onSignUpData);
    // on<RemoteSingupSendOtpEmail>(_onSendOtpEmail);
    // on<RemoteSignupGetBasicUserInfo>(_onGetBasicUserInfo);
  }

  Future<void> _onSignUpData(
      RemoteSignupData event, Emitter<RemoteSignupState> emit) async {
    try {
      emit(const RemoteSignupLoading());
      final response =
          await _signupUsecase.registerUser(event.registerationMap);
      developer.log('Response of register user : ${response.data!.message}');
      emit(RemoteSignupDone(response.data!));
    } catch (e) {
      developer.log('Ending up in error : $e');
      emit(const RemoteSignupError());
    }
  }

  // Future<void> _onSendOtpEmail(
  //     RemoteSingupSendOtpEmail event, Emitter<RemoteSignupState> emit) async {
  //   try {
  //     emit(const RemoteSignupSendOtpEmailLoading());
  //     final response = _signupUsecase.sendOtpEmail(event.emailMap);
  //     emit(const RemoteSignupSendOtpEmailDone(
  //         response.data!)); // pass data here once created response model
  //   } catch (e) {
  //     emit(const RemoteSignupSendOtpEmailError());
  //   }
  // }
}
