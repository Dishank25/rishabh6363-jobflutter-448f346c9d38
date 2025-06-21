import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/views/detailed_signup/data/model/basic_user_data_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/colleges_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/courses_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/specialization_response.dart';

@immutable
abstract class DetailedSignupState extends Equatable {
  const DetailedSignupState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DetailedSignupInitial extends DetailedSignupState {
  const DetailedSignupInitial();
}

class DetailedSignupGetBasicUserInfoLoading extends DetailedSignupState {
  const DetailedSignupGetBasicUserInfoLoading();
}

class DetailedSignupGetBasicUserInfoLoaded extends DetailedSignupState {
  final BasicUserInfoResponse basicUserInfoResponse;

  const DetailedSignupGetBasicUserInfoLoaded(this.basicUserInfoResponse);
}

class DetailedSignupGetBasicUserInfoError extends DetailedSignupState {
  const DetailedSignupGetBasicUserInfoError();
}

class DetailedSignupGetCollegesLoading extends DetailedSignupState {
  const DetailedSignupGetCollegesLoading();
}

class DetailedSignupGetCollegesLoaded extends DetailedSignupState {
  final CollegesListResponse collegesListResponse;

  const DetailedSignupGetCollegesLoaded(this.collegesListResponse);
}

class DetailedSignupGetCollegesError extends DetailedSignupState {
  const DetailedSignupGetCollegesError();
}

class DetailedSignupGetSpecializationLoading extends DetailedSignupState {
  const DetailedSignupGetSpecializationLoading();
}

class DetailedSignupGetSpecializationLoaded extends DetailedSignupState {
  final SpecializationListResponse specializationListResponse;

  const DetailedSignupGetSpecializationLoaded(this.specializationListResponse);
}

class DetailedSignupGetSpecializationError extends DetailedSignupState {
  const DetailedSignupGetSpecializationError();
}

class DetailedSignupGetCoursesLoading extends DetailedSignupState {
  const DetailedSignupGetCoursesLoading();
}

class DetailedSignupGetCoursesLoaded extends DetailedSignupState {
  final CoursesListResponse coursesListResponse;

  const DetailedSignupGetCoursesLoaded(this.coursesListResponse);
}

class DetailedSignupGetCoursesError extends DetailedSignupState {
  const DetailedSignupGetCoursesError();
}

class DetailedSignupGetCollegeDetailsLoading extends DetailedSignupState {
  const DetailedSignupGetCollegeDetailsLoading();
}

class DetailedSignupGetCollegeDetailsError extends DetailedSignupState {
  const DetailedSignupGetCollegeDetailsError();
}

class DetailedSignupGetCollegeDetailsLoaded extends DetailedSignupState {
  final CollegesListResponse collegesListResponse;
  final SpecializationListResponse specializationListResponse;
  final CoursesListResponse coursesListResponse;

  const DetailedSignupGetCollegeDetailsLoaded(this.collegesListResponse,
      this.specializationListResponse, this.coursesListResponse);
}
