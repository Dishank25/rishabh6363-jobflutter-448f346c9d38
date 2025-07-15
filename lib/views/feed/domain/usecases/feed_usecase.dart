import 'package:job_portal/utils/resourses/data_state.dart';
import 'package:job_portal/utils/usecase/usecases.dart';
import 'package:job_portal/views/feed/domain/entities/feed_entity.dart';
import 'package:job_portal/views/feed/domain/repository/feed_repository.dart';

class FeedUsecase
    implements UseCase<DataState<FeedEntity>, Map<String, dynamic>> {
  final FeedRepository _repository;
  FeedUsecase(this._repository);

  @override
  Future<DataState<FeedEntity>> call({Map<String, dynamic>? params}) async {
    return _repository.getFeedPosts();
  }
}
