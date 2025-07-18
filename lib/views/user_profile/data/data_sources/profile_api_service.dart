import 'package:dio/dio.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/views/user_profile/data/models/public_profile_model.dart';
import 'package:job_portal/views/user_profile/data/models/terms_and_conditions_response.dart';
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
}
