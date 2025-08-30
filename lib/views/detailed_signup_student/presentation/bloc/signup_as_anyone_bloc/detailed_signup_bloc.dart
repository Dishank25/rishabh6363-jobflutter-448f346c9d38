import 'dart:developer' as developer show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/detailed_signup_student/domain/usecases/detailed_signup_usecase.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/signup_as_anyone_bloc/detailed_signup_event.dart';
import 'package:job_portal/views/detailed_signup_student/presentation/bloc/signup_as_anyone_bloc/detailed_signup_state.dart';

class DetailedSignupBloc
    extends Bloc<DetailedSignupEvent, DetailedSignupState> {
  final DetailedSignupUsecase _detailedSignupUsecase;

  DetailedSignupBloc(this._detailedSignupUsecase)
      : super(const DetailedSignupInitial()) {
    on<DetailedSignupGetBasicUserInfo>(_onGetBasicUserInfo);
    on<DetailedSignupGetCollegeDetails>(_onGetCollegeDetails);
    on<DetailedSingupSubmitUserDetails>(_onSubmitUserDetails);
    on<DetailedSignupGetSpecializations>(_onGetSpecializations);
  }

  Future<void> _onGetBasicUserInfo(DetailedSignupGetBasicUserInfo event,
      Emitter<DetailedSignupState> emit) async {
    try {
      emit(const DetailedSignupGetBasicUserInfoLoading());
      final responseUserInfo =
          await _detailedSignupUsecase.getBasicUserInfo(event.emailMap);
      final responseLocations = await _detailedSignupUsecase.getLocations();
      developer.log(
          'Response of get basic user info : ${responseUserInfo.data!.message}');
      emit(DetailedSignupGetBasicUserInfoLoaded(
          responseUserInfo.data!, responseLocations.data!));
    } catch (e) {
      developer.log('Ending up in error get basic user info : $e');
      emit(const DetailedSignupGetBasicUserInfoError());
    }
  }

  Future<void> _onGetCollegeDetails(DetailedSignupGetCollegeDetails event,
      Emitter<DetailedSignupState> emit) async {
    try {
      emit(const DetailedSignupGetCollegeDetailsLoading());
      developer.log('Course and clg updated .1bloc');

      final colleges = await _detailedSignupUsecase.getColleges(event.emailMap);
      final courses = await _detailedSignupUsecase.getCourses();
      // final jobRoles = await _detailedSignupUsecase.getJobRoles();
      developer.log('Course and clg updated .2bloc');

      emit(DetailedSignupGetCollegeDetailsLoaded(
        colleges.data!,
        courses.data!,
        // jobRoles.data!,
      ));
      developer.log('Course and clg updated .3bloc');
    } catch (e) {
      emit(const DetailedSignupGetCollegeDetailsError());
      developer.log('Course and clg updated .4bloc');
    }
  }

  Future<void> _onGetSpecializations(DetailedSignupGetSpecializations event,
      Emitter<DetailedSignupState> emit) async {
    try {
      emit(const DetailedSignupSpecializationLoading());
      final specializations =
          await _detailedSignupUsecase.getSpecialization(event.courseId);
      emit(DetailedSignupSpecializationLoaded(
        specializations.data!,
      ));
    } catch (e) {
      emit(const DetailedSignupSpecializationError());
    }
  }

  Future<void> _onSubmitUserDetails(DetailedSingupSubmitUserDetails event,
      Emitter<DetailedSignupState> emit) async {
    try {
      emit(const DetailedSingupSubmitUserDetailsLoading());
      final response =
          await _detailedSignupUsecase.submitDetailedUserProfile(event.params);
      emit(DetailedSingupSubmitUserDetailsLoaded(response.data!));
    } catch (e) {
      emit(const DetailedSingupSubmitUserDetailsError());
    }
  }
}
