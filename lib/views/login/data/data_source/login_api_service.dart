import 'package:dio/dio.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/views/login/data/models/login_user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String? baseUrl}) = _LoginApiService;

  @POST(Urls.userLogin)
  Future<HttpResponse<LoginUserResponse>> userLogin(
      @Body() Map<String, dynamic> loginMap);
}
