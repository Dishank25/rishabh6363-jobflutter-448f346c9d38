class FeedPostCommentEntity {
  final String message;
  final List<CommentEntity> comments;
  final int commentCount;

  FeedPostCommentEntity({
    required this.message,
    required this.comments,
    required this.commentCount,
  });
}

class CommentEntity {
  final dynamic userId;
  final String comment;
  final DateTime createdAt;

  CommentEntity({
    required this.userId,
    required this.comment,
    required this.createdAt,
  });
}
