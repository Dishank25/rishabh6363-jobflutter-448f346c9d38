class FollowersEntity {
  final int count;
  final List<Follower> followers;

  FollowersEntity({
    required this.count,
    required this.followers,
  });
}

class Follower {
  final String firstName;
  final String lastName;
  final String userRole;

  Follower({
    required this.firstName,
    required this.lastName,
    required this.userRole,
  });
}

class FollowingEntity {
  final int count;
  final List<Following> following;

  FollowingEntity({
    required this.count,
    required this.following,
  });
}

class Following {
  final String firstName;
  final String lastName;
  final String userRole;

  Following({
    required this.firstName,
    required this.lastName,
    required this.userRole,
  });
}
