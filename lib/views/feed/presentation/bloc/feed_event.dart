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
