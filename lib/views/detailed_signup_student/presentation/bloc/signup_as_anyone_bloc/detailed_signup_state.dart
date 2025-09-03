import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/basic_user_data_response.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/submit_detailed_user_profile.dart';
import 'package:job_portal/views/detailed_signup_student/domain/entities/metadata_entities.dart';

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
  final LocationListEntity locations;

  const DetailedSignupGetBasicUserInfoLoaded(
      this.basicUserInfoResponse, this.locations);
}

class DetailedSignupGetBasicUserInfoError extends DetailedSignupState {
  const DetailedSignupGetBasicUserInfoError();
}

class DetailedSignupGetCollegeDetailsLoading extends DetailedSignupState {
  const DetailedSignupGetCollegeDetailsLoading();
}

class DetailedSignupGetCollegeDetailsLoaded extends DetailedSignupState {
  final CollegeListEntity collegesListResponse;
  final CourseListEntity coursesListResponse;
  // final JobRolesListResponse jobRolesListResponse;

  const DetailedSignupGetCollegeDetailsLoaded(
    this.collegesListResponse,
    this.coursesListResponse,
    // this.jobRolesListResponse,
  );
}

class DetailedSignupGetCollegeDetailsError extends DetailedSignupState {
  const DetailedSignupGetCollegeDetailsError();
}

class DetailedSingupSubmitUserDetailsLoading extends DetailedSignupState {
  const DetailedSingupSubmitUserDetailsLoading();
}

class DetailedSingupSubmitUserDetailsLoaded extends DetailedSignupState {
  final SubmitDetailedUserProfile submitDetailedUserProfile;

  const DetailedSingupSubmitUserDetailsLoaded(this.submitDetailedUserProfile);
}

class DetailedSingupSubmitUserDetailsError extends DetailedSignupState {
  const DetailedSingupSubmitUserDetailsError();
}

class DetailedSignupSpecializationLoading extends DetailedSignupState {
  const DetailedSignupSpecializationLoading();
}

class DetailedSignupSpecializationLoaded extends DetailedSignupState {
  final List<SpecializationEntity> specializationListResponse;
  const DetailedSignupSpecializationLoaded(this.specializationListResponse);
}

class DetailedSignupSpecializationError extends DetailedSignupState {
  const DetailedSignupSpecializationError();
}
