class LoginUserResponse {
  final String message;
  final String token;
  final LoginUser user;

  LoginUserResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
    return LoginUserResponse(
      message: json['message'],
      token: json['token'],
      user: LoginUser.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'user': user.toJson(),
    };
  }
}

class LoginUser {
  final int id;
  final String email;
  final String role;

  LoginUser({
    required this.id,
    required this.email,
    required this.role,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: json['id'],
      email: json['email'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role,
    };
  }
}
