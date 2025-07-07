import 'dart:developer' as developer show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/recruiter_signup/domain/usecases/recruiter_signup_usecase.dart';
import 'package:job_portal/views/recruiter_signup/presentation/bloc/recruiter_signup_state.dart';
import 'package:job_portal/views/recruiter_signup/presentation/bloc/recruiter_singup_event.dart';

class RecruiterSignupBloc
    extends Bloc<RecruiterSignupEvent, RecruiterSignupState> {
  final RecruiterSignupUsecase _recruiterSignupUsecase;
  RecruiterSignupBloc(this._recruiterSignupUsecase)
      : super(const RecruiterSignupInitialize()) {
    on<RecruiterSignupData>(_onRecruiterSignup);
  }

  Future<void> _onRecruiterSignup(
      RecruiterSignupData event, Emitter<RecruiterSignupState> emit) async {
    try {
      emit(const RecruiterSignupLoading());
      final response =
          await _recruiterSignupUsecase(params: event.registerationMap);
      developer.log(
          'Check recruiter signup in bloc before emiting : ${response.data?.message}');
      emit(RecruiterSignupLoaded(response.data!));
    } catch (e) {
      developer.log('Error encounter on email already exist in rec bloc : $e');
      emit(const RecruiterSignupError());
    }
  }
}
