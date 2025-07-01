import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:job_portal/views/recruiter_signup/domain/entities/sigup_user_entity.dart';

@immutable
abstract class RecruiterSignupState extends Equatable {
  const RecruiterSignupState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RecruiterSignupInitialize extends RecruiterSignupState {
  const RecruiterSignupInitialize();
}

class RecruiterSignupLoading extends RecruiterSignupState {
  const RecruiterSignupLoading();
}

class RecruiterSignupLoaded extends RecruiterSignupState {
  // ignore: unused_field
  final SignUpUserEntity signUpUserEntity;

  const RecruiterSignupLoaded(this.signUpUserEntity);
}

class RecruiterSignupError extends RecruiterSignupState {
  const RecruiterSignupError();
}
