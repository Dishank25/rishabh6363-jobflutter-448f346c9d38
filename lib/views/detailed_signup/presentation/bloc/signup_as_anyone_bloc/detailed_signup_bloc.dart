import 'dart:developer' as developer show log;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/detailed_signup/domain/usecases/detailed_signup_usecase.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/signup_as_anyone_bloc/detailed_signup_event.dart';
import 'package:job_portal/views/detailed_signup/presentation/bloc/signup_as_anyone_bloc/detailed_signup_state.dart';

class DetailedSignupBloc
    extends Bloc<DetailedSignupEvent, DetailedSignupState> {
  final DetailedSignupUsecase _detailedSignupUsecase;

  DetailedSignupBloc(this._detailedSignupUsecase)
      : super(const DetailedSignupInitial()) {
    on<DetailedSignupGetBasicUserInfo>(_onGetBasicUserInfo);
    on<DetailedSignupGetCollegeDetails>(_onGetCollegeDetails);
    on<DetailedSingupSubmitUserDetails>(_onSubmitUserDetails);
    // on<DetailedSignupGetColleges>(_onGetColleges);
    // on<DetailedSignupGetSpecialization>(_onGetSpecialization);
    // on<DetailedSignupGetCourses>(_onGetCourses);
    // on<DetailedSignupGetJobRoles>(_onGetJobRoles);
  }

  Future<void> _onGetBasicUserInfo(DetailedSignupGetBasicUserInfo event,
      Emitter<DetailedSignupState> emit) async {
    try {
      emit(const DetailedSignupGetBasicUserInfoLoading());
      final response =
          await _detailedSignupUsecase.getBasicUserInfo(event.emailMap);
      developer
          .log('Response of get basic user info : ${response.data!.message}');
      emit(DetailedSignupGetBasicUserInfoLoaded(response.data!));
    } catch (e) {
      developer.log('Ending up in error get basic user info : $e');
      emit(const DetailedSignupGetBasicUserInfoError());
    }
  }

  Future<void> _onGetCollegeDetails(DetailedSignupGetCollegeDetails event,
      Emitter<DetailedSignupState> emit) async {
    try {
      emit(const DetailedSignupGetCollegeDetailsLoading());
      final colleges = await _detailedSignupUsecase.getColleges(event.emailMap);
      final specializations = await _detailedSignupUsecase.getSpecialization();
      final courses = await _detailedSignupUsecase.getCourses();
      final jobRoles = await _detailedSignupUsecase.getJobRoles();
      emit(DetailedSignupGetCollegeDetailsLoaded(colleges.data!,
          specializations.data!, courses.data!, jobRoles.data!));
    } catch (e) {
      emit(const DetailedSignupGetCollegeDetailsError());
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

// Future<void> _onGetColleges(DetailedSignupGetColleges event,
  //     Emitter<DetailedSignupState> emit) async {
  //   try {
  //     emit(const DetailedSignupGetCollegesLoading());
  //     final response = await _detailedSignupUsecase.getColleges(event.emailMap);
  //     developer.log('Response of get colleges : ${response.data!}');
  //     emit(DetailedSignupGetCollegesLoaded(response.data!));
  //   } catch (e) {
  //     developer.log('Ending up in error of get colleges : $e');
  //     emit(const DetailedSignupGetCollegesError());
  //   }
  // }
  // Future<void> _onGetSpecialization(DetailedSignupGetSpecialization event,
  //     Emitter<DetailedSignupState> emit) async {
  //   try {
  //     emit(const DetailedSignupGetSpecializationLoading());
  //     final response = await _detailedSignupUsecase.getSpecialization();
  //     developer.log('Response of get specializations : ${response.data!}');
  //     emit(DetailedSignupGetSpecializationLoaded(response.data!));
  //   } catch (e) {
  //     developer.log('Ending up in error of get specializations : $e');
  //     emit(const DetailedSignupGetSpecializationError());
  //   }
  // }
  // Future<void> _onGetCourses(
  //     DetailedSignupGetCourses event, Emitter<DetailedSignupState> emit) async {
  //   try {
  //     emit(const DetailedSignupGetCoursesLoading());
  //     final response = await _detailedSignupUsecase.getCourses();
  //     developer.log('Response of get courses : ${response.data!}');
  //     emit(DetailedSignupGetCoursesLoaded(response.data!));
  //   } catch (e) {
  //     developer.log('Ending up in error of get courses : $e');
  //     emit(const DetailedSignupGetCollegesError());
  //   }
  // }
  // Future<void> _onGetJobRoles(DetailedSignupGetJobRoles event,
  //     Emitter<DetailedSignupState> emit) async {
  //   try {
  //     emit(const DetailedSignupJobRolesLoading());
  //     final response = await _detailedSignupUsecase.getJobRoles();
  //     emit(DetailedSignupJobRolesLoaded(response.data!));
  //   } catch (e) {
  //     emit(const DetailedSignupJobRolesError());
  //   }
  // }