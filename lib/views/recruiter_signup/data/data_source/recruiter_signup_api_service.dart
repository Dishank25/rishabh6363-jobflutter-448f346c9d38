import 'package:dio/dio.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/views/recruiter_signup/data/models/recruiter_signup_response.dart';
import 'package:job_portal/views/signup/data/models/signup_user_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'recruiter_signup_api_service.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class RecruiterSignupApiService {
  factory RecruiterSignupApiService(Dio dio, {String? baseUrl}) =
      _RecruiterSignupApiService;

  @POST(Urls.userRegisteration)
  Future<HttpResponse<SignUpRecruiterResponse>> registerUser(
      @Body() Map<String, dynamic> registerationMap);
}
