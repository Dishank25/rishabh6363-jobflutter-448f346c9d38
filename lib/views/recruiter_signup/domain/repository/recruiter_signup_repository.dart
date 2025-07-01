import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/recruiter_signup/domain/entities/sigup_user_entity.dart';
import 'package:job_portal/views/signup/data/models/signup_user_response.dart';

abstract class RecruiterSignupRepository {
  Future<DataState<SignUpUserEntity>> registerUser(
      Map<String, dynamic> registerationMap);
}
