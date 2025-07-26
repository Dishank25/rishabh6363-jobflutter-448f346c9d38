class CreateFeedPostEntity {
  final String message;
  final FeedPostEntity feedPost;

  CreateFeedPostEntity({
    required this.message,
    required this.feedPost,
  });
}

class FeedPostEntity {
  final int likeCount;
  final int commentCount;
  final String comments;
  final int id;
  final String userId;
  final String image;
  final String caption;
  final String userRole;
  final String? profilePic;
  final DateTime updatedAt;
  final DateTime createdAt;

  FeedPostEntity({
    required this.likeCount,
    required this.commentCount,
    required this.comments,
    required this.id,
    required this.userId,
    required this.image,
    required this.caption,
    required this.userRole,
    required this.profilePic,
    required this.updatedAt,
    required this.createdAt,
  });
}
