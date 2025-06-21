import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/signup/data/models/signup_user_response.dart';

abstract class SignupRepository {
  Future<DataState<SignUpUserResponse>> registerUser(
      Map<String, dynamic> registerationMap);

  // Future<DataState<SendOtpEmailResponse>> sendOtpEmail(
  //     Map<String, dynamic> emailMap);
}
