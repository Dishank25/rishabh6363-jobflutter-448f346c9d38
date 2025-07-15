class SignUpUserResponse {
  final String message;
  final String? token;
  final User? user;

  SignUpUserResponse({
    required this.message,
    this.token,
    this.user,
  });

  factory SignUpUserResponse.fromJson(Map<String, dynamic> json) {
    return SignUpUserResponse(
      message: json['message'] ?? '',
      token: json['token'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (token != null) 'token': token,
      if (user != null) 'user': user!.toJson(),
    };
  }
}

class User {
  final int id;
  final String email;

  User({
    required this.id,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
