import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal/views/feed/domain/usecases/feed_usecase.dart';
import 'package:job_portal/views/feed/presentation/bloc/feed_event.dart';
import 'package:job_portal/views/feed/presentation/bloc/feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedUsecase _feedUsecase;
  FeedBloc(this._feedUsecase) : super(const FeedInitial()) {
    on<LoadFeedPosts>(_onLoadFeedPosts);
  }

  Future<void> _onLoadFeedPosts(
      LoadFeedPosts event, Emitter<FeedState> emit) async {
    try {
      emit(const FeedPostsLoading());
      final response = await _feedUsecase(params: null);
      emit(FeedPostsLoaded(response.data!));
      // final
    } catch (e) {
      emit(const FeedPostsError());
    }
  }
}
