class FeedEntity {
  final int totalPosts;
  final int currentPage;
  final int totalPages;
  final List<PostEntity> posts;

  const FeedEntity({
    required this.totalPosts,
    required this.currentPage,
    required this.totalPages,
    required this.posts,
  });
}

class PostEntity {
  final int id;
  final int userId;
  final String? image;
  final String caption;
  final String userRole;
  final String? profilePic;
  final int likeCount;
  final int commentCount;
  final List<CommentEntity> comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserEntity user;
  final bool isLiked;

  const PostEntity({
    required this.id,
    required this.userId,
    required this.image,
    required this.caption,
    required this.userRole,
    required this.profilePic,
    required this.likeCount,
    required this.commentCount,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.isLiked,
  });
}

class CommentEntity {
  final dynamic userId;
  final String comment;
  final DateTime createdAt;
  final String firstName;
  final String lastName;
  final String? profilePic;

  const CommentEntity({
    required this.userId,
    required this.comment,
    required this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.profilePic,
  });
}

// "firstName": "Amarjeet",
// "lastName": "Patel",
// "profilePic": null

class UserEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String? profilePic;
  final int followersCount;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profilePic,
    required this.followersCount,
  });
}
