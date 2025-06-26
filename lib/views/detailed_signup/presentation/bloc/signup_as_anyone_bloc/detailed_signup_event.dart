import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DetailedSignupEvent extends Equatable {
  const DetailedSignupEvent();
}

class DetailedSignupInitialize extends DetailedSignupEvent {
  const DetailedSignupInitialize();

  @override
  List<Object?> get props => [];
}

class DetailedSignupGetBasicUserInfo extends DetailedSignupEvent {
  final Map<String, dynamic> emailMap;

  const DetailedSignupGetBasicUserInfo(this.emailMap);

  @override
  List<Object?> get props => [emailMap];
}

class DetailedSignupGetCollegeDetails extends DetailedSignupEvent {
  final Map<String, dynamic> emailMap;

  const DetailedSignupGetCollegeDetails(this.emailMap);

  @override
  List<Object?> get props => [emailMap];
}

class DetailedSingupSubmitUserDetails extends DetailedSignupEvent {
  const DetailedSingupSubmitUserDetails();

  @override
  List<Object?> get props => [];
}

// class DetailedSignupGetColleges extends DetailedSignupEvent {
//   final Map<String, dynamic> emailMap;
//   const DetailedSignupGetColleges(this.emailMap);
//   @override
//   List<Object?> get props => [emailMap];
// }
// class DetailedSignupGetSpecialization extends DetailedSignupEvent {
//   const DetailedSignupGetSpecialization();
//   @override
//   List<Object?> get props => [];
// }
// class DetailedSignupGetCourses extends DetailedSignupEvent {
//   const DetailedSignupGetCourses();
//   @override
//   List<Object?> get props => [];
// }
// class DetailedSignupGetJobRoles extends DetailedSignupEvent {
//   const DetailedSignupGetJobRoles();
//   @override
//   List<Object?> get props => [];
// }
