import 'package:job_portal/views/feed/domain/entities/feed_post_like_entity.dart';

class FeedPostLikeModel extends FeedPostLikeEntity {
  FeedPostLikeModel({
    required super.message,
    required super.likeCount,
  });

  factory FeedPostLikeModel.fromJson(Map<String, dynamic> json) {
    return FeedPostLikeModel(
      message: json['message'] ?? '',
      likeCount: json['likeCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'likeCount': likeCount,
    };
  }
}
