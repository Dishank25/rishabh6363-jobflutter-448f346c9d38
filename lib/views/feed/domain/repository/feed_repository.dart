import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/views/feed/domain/entities/feed_entity.dart';

abstract class FeedRepository {
  Future<DataState<FeedEntity>> getFeedPosts();
}
