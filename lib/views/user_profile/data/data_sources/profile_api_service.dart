import 'package:dio/dio.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/views/user_profile/data/models/public_profile_model.dart';
import 'package:job_portal/views/user_profile/data/models/terms_and_conditions_response.dart';
import 'package:job_portal/views/user_profile/data/models/update_user_email_model.dart';
import 'package:job_portal/views/user_profile/data/models/update_user_profile_model.dart';
import 'package:job_portal/views/user_profile/data/models/user_details_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String? baseUrl}) = _ProfileApiService;

  @GET('${Urls.getPublicProfile}{id}')
  Future<HttpResponse<UserProfileModel>> getPublicProfile(@Path() String id);

  @GET('${Urls.getUserDetails}{id}')
  Future<HttpResponse<UserDetailModel>> getUserDetails(@Path() String id);

  @GET(Urls.getTermsAndConditions)
  Future<HttpResponse<TermsAndConditionModel>> getTermsAndConditions();

  @PUT("${Urls.updateUserDetailsById}{id}")
  Future<HttpResponse<UpdateUserProfileModel>> updateUserDetailsById(
      @Path() String id, @Body() Map<String, dynamic> params);

  @POST(Urls.changeUserEmail)
  Future<HttpResponse<UpdateUserEmailModel>> changeUserEmail(
      @Body() Map<String, dynamic> params);
}
