import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/detailed_signup/data/model/basic_user_data_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/colleges_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/courses_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/specialization_response.dart';

abstract class DetailedSignupRepository {
  Future<DataState<BasicUserInfoResponse>> getBasicUserInfo(
      Map<String, dynamic> emailMap);

  Future<DataState<CollegesListResponse>> getColleges(
      Map<String, dynamic> emailMap);

  Future<DataState<SpecializationListResponse>> getSpecialization();

  Future<DataState<CoursesListResponse>> getCourses();
}
