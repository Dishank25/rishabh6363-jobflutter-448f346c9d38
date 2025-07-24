import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class FeedEvent extends Equatable {
  const FeedEvent();
}

class LoadFeedPosts extends FeedEvent {
  const LoadFeedPosts();

  @override
  List<Object?> get props => [];
}

class LoadFeedPostLike extends FeedEvent {
  final String feedPostId;
  final Map<String, dynamic> map;

  const LoadFeedPostLike(this.feedPostId, this.map);

  @override
  List<Object?> get props => [feedPostId, map];
}

class LoadFeedPostComment extends FeedEvent {
  final String feedPostId;
  final Map<String, dynamic> map;

  const LoadFeedPostComment(this.feedPostId, this.map);

  @override
  List<Object?> get props => [feedPostId, map];
}
