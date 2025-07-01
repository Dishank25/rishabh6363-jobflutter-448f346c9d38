import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/detailed_signup/data/model/basic_user_data_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/colleges_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/courses_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/job_roles_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/specialization_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/submit_detailed_user_profile.dart';

abstract class DetailedSignupRepository {
  Future<DataState<BasicUserInfoResponse>> getBasicUserInfo(
      Map<String, dynamic> emailMap);

  Future<DataState<CollegesListResponse>> getColleges(
      Map<String, dynamic> emailMap);

  Future<DataState<SpecializationListResponse>> getSpecialization();

  Future<DataState<CoursesListResponse>> getCourses();

  Future<DataState<JobRolesListResponse>> getJobRoles();

  Future<DataState<SubmitDetailedUserProfile>> submitDetailedUserProfile(
      Map<String, dynamic> params);
}
