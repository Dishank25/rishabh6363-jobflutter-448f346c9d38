import 'package:dio/dio.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/views/detailed_signup/data/model/basic_user_data_response.dart';
import 'package:job_portal/views/signup/data/models/signup_user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_api_service.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class SignupApiService {
  factory SignupApiService(Dio dio, {String? baseUrl}) = _SignupApiService;

  @POST(Urls.userRegisteration)
  Future<HttpResponse<SignUpUserResponse>> registerUser(
      @Body() Map<String, dynamic> registerationMap);

  // @POST(Urls.sendOtpEmail)
  // Future<HttpResponse<SendOtpEmailResponse>> sendOtpEmail(
  //     @Body() Map<String, dynamic> emailMap);

  // @POST(Urls.getUserBasicInfo)
  // Future<HttpResponse<BasicUserInfoResponse>> getBasicUserInfo(
  //     @Body() Map<String, dynamic> emailMap);
}
