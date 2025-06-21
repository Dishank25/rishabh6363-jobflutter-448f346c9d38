class BasicUserInfoResponse {
  final String message;
  final BasicUser user;

  BasicUserInfoResponse({
    required this.message,
    required this.user,
  });

  factory BasicUserInfoResponse.fromJson(Map<String, dynamic> json) {
    return BasicUserInfoResponse(
      message: json['message'],
      user: BasicUser.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user.toJson(),
    };
  }
}

class BasicUser {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  BasicUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory BasicUser.fromJson(Map<String, dynamic> json) {
    return BasicUser(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }
}
