import 'package:http/http.dart';
import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/signup/data/models/signup_user_response.dart';
import 'package:job_portal/views/signup/domain/repository/signup_repository.dart';

class SignupUsecase {
  final SignupRepository _signupRepository;

  SignupUsecase(this._signupRepository);

  Future<DataState<SignUpUserResponse>> registerUser(
      Map<String, dynamic> registerationMap) async {
    final response = await _signupRepository.registerUser(registerationMap);
    return response;
  }

  // Future<DataState<SendOtpEmailResponse>> sendOtpEmail(
  //     Map<String, dynamic> emailMap) async {
  //   final response = await _signupRepository.sendOtpEmail(emailMap);
  //   return response;
  // }
}
