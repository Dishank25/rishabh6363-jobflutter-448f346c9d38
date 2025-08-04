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

// "user": {
//         "id": 112,
//         "firstName": "John",
//         "lastName": "Doe",
//         "phone": "58798598",
//         "email": "axqwwqc@gmail.com",
//         "userRole": "STUDENT"
//     }

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String userRole;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.userRole,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
      userRole: json['userRole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
