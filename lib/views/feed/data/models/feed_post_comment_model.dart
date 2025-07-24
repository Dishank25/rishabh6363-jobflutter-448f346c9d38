import 'package:job_portal/views/feed/domain/entities/feed_post_comment_entity.dart';

class FeedPostCommentModel extends FeedPostCommentEntity {
  FeedPostCommentModel({
    required super.message,
    required List<CommentModel> comments,
    required super.commentCount,
  }) : super(comments: comments);

  factory FeedPostCommentModel.fromJson(Map<String, dynamic> json) {
    return FeedPostCommentModel(
      message: json['message'] ?? '',
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => CommentModel.fromJson(e))
              .toList() ??
          [],
      commentCount: json['commentCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'comments': comments.map((e) => (e as CommentModel).toJson()).toList(),
      'commentCount': commentCount,
    };
  }
}

class CommentModel extends CommentEntity {
  CommentModel({
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

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
