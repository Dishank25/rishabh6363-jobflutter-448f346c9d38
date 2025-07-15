import 'package:dio/dio.dart';
import 'package:job_portal/utils/constants/urls.dart';
import 'package:job_portal/views/feed/data/models/feed_response.dart';
import 'package:retrofit/retrofit.dart';

part 'feed_api_service.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class FeedApiService {
  factory FeedApiService(Dio dio, {String? baseUrl}) = _FeedApiService;

  @GET(Urls.getFeedPosts)
  Future<HttpResponse<FeedResponseModel>> getFeedPosts();
}
