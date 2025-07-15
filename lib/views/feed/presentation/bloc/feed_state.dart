import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:job_portal/views/feed/domain/entities/feed_entity.dart';

@immutable
abstract class FeedState extends Equatable {
  const FeedState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FeedInitial extends FeedState {
  const FeedInitial();
}

class FeedPostsLoading extends FeedState {
  const FeedPostsLoading();
}

class FeedPostsLoaded extends FeedState {
  final FeedEntity feedEntity;
  const FeedPostsLoaded(this.feedEntity);
}

class FeedPostsError extends FeedState {
  const FeedPostsError();
}
