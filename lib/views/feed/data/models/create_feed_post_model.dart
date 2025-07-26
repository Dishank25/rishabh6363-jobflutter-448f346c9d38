import 'package:job_portal/views/feed/domain/entities/create_feed_post_entity.dart';

class CreateFeedPostModel extends CreateFeedPostEntity {
  CreateFeedPostModel({
    required super.message,
    required FeedPostModel super.feedPost,
  });

  factory CreateFeedPostModel.fromJson(Map<String, dynamic> json) {
    return CreateFeedPostModel(
      message: json['message'],
      feedPost: FeedPostModel.fromJson(json['feedPost']),
    );
  }
}

class FeedPostModel extends FeedPostEntity {
  FeedPostModel({
    required super.likeCount,
    required super.commentCount,
    required super.comments,
    required super.id,
    required super.userId,
    required super.image,
    required super.caption,
    required super.userRole,
    required super.profilePic,
    required super.updatedAt,
    required super.createdAt,
  });

  factory FeedPostModel.fromJson(Map<String, dynamic> json) {
    return FeedPostModel(
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      comments: json['comments'],
      id: json['id'],
      userId: json['userId'],
      image: json['image'],
      caption: json['caption'],
      userRole: json['userRole'],
      profilePic: json['profilePic'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
