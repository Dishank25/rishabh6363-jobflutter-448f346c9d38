import 'package:job_portal/views/user_profile/domain/entities/followers_entity.dart';

class FollowersModel extends FollowersEntity {
  FollowersModel({
    required int count,
    required List<FollowerModel> followers,
  }) : super(count: count, followers: followers);

  factory FollowersModel.fromJson(Map<String, dynamic> json) {
    return FollowersModel(
      count: json['count'] ?? 0,
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => FollowerModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'followers': followers.map((e) => (e as FollowerModel).toJson()).toList(),
    };
  }
}

class FollowerModel extends Follower {
  FollowerModel({
    required String firstName,
    required String lastName,
    required String userRole,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          userRole: userRole,
        );

  factory FollowerModel.fromJson(Map<String, dynamic> json) {
    return FollowerModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userRole: json['userRole'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userRole': userRole,
    };
  }
}

class FollowingModel extends FollowingEntity {
  FollowingModel({
    required int count,
    required List<FollowingItemModel> following,
  }) : super(count: count, following: following);

  factory FollowingModel.fromJson(Map<String, dynamic> json) {
    return FollowingModel(
      count: json['count'] ?? 0,
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => FollowingItemModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'following':
          following.map((e) => (e as FollowingItemModel).toJson()).toList(),
    };
  }
}

class FollowingItemModel extends Following {
  FollowingItemModel({
    required String firstName,
    required String lastName,
    required String userRole,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          userRole: userRole,
        );

  factory FollowingItemModel.fromJson(Map<String, dynamic> json) {
    return FollowingItemModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userRole: json['userRole'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userRole': userRole,
    };
  }
}
