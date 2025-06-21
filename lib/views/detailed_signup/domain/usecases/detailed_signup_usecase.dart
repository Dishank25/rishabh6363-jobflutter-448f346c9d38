import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/detailed_signup/data/model/basic_user_data_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/colleges_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/courses_response.dart';
import 'package:job_portal/views/detailed_signup/data/model/specialization_response.dart';
import 'package:job_portal/views/detailed_signup/domain/repository/detailed_signup_repository.dart';

class DetailedSignupUsecase {
  final DetailedSignupRepository _repository;
  DetailedSignupUsecase(this._repository);

  Future<DataState<BasicUserInfoResponse>> getBasicUserInfo(
      Map<String, dynamic> emailMap) async {
    final response = await _repository.getBasicUserInfo(emailMap);
    return response;
  }

  Future<DataState<CollegesListResponse>> getColleges(
      Map<String, dynamic> emailMap) async {
    final response = await _repository.getColleges(emailMap);
    return response;
  }

  Future<DataState<SpecializationListResponse>> getSpecialization() async {
    final response = await _repository.getSpecialization();
    return response;
  }

  Future<DataState<CoursesListResponse>> getCourses() async {
    final response = await _repository.getCourses();
    return response;
  }
}
