import 'package:dio/dio.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/views/detailed_signup_student/data/model/basic_user_data_response.dart';
import 'package:job_portal/views/job_related/data/models/all_jobs_response.dart';
import 'package:job_portal/views/job_related/data/models/job_details_reponse.dart';
import 'package:job_portal/views/signup_recruiter/data/models/recruiter_signup_response.dart';
import 'package:job_portal/views/signup_recruiter/domain/entities/sigup_user_entity.dart';
import 'package:job_portal/views/signup_student/data/models/signup_user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'job_screens_api_service.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class JobScreensApiService {
  factory JobScreensApiService(Dio dio, {String? baseUrl}) =
      _JobScreensApiService;

  @GET(Urls.opportunities)
  Future<HttpResponse<AllJobsResponse>> getOpportunities();

  @GET('${Urls.jobDetails}{jobId}')
  Future<HttpResponse<JobDetailsResponseModel>> getJobDetails(
      @Path() String jobId);
}
