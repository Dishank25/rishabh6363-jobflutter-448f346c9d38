import 'package:job_portal/views/feed/domain/entities/feed_entity.dart';

class FeedResponseModel extends FeedEntity {
  const FeedResponseModel({
    required super.totalPosts,
    required super.currentPage,
    required super.totalPages,
    required super.posts,
  });

  factory FeedResponseModel.fromJson(Map<String, dynamic> json) {
    return FeedResponseModel(
      totalPosts: json['totalPosts'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      posts:
          List<PostModel>.from(json['posts'].map((e) => PostModel.fromJson(e))),
    );
  }
}

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.userId,
    required super.image,
    required super.caption,
    required super.userRole,
    required super.profilePic,
    required super.likeCount,
    required super.commentCount,
    required super.comments,
    required super.createdAt,
    required super.updatedAt,
    required super.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      image: json['image'],
      caption: json['caption'],
      userRole: json['userRole'],
      profilePic: json['profilePic'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      comments: List<CommentModel>.from(
          json['comments'].map((e) => CommentModel.fromJson(e))),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      user: UserModel.fromJson(json['User']),
    );
  }
}

class CommentModel extends CommentEntity {
  const CommentModel({
    required super.userId,
    required super.comment,
    required super.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      userId: json['userId'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.profilePic,
    required super.followersCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePic: json['profilePic'],
      followersCount: json['followersCount'],
    );
  }
}
