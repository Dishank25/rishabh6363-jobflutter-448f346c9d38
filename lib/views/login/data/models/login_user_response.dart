// class LoginUserResponse {
//   final String message;
//   final String token;
//   final LoginUser user;

//   LoginUserResponse({
//     required this.message,
//     required this.token,
//     required this.user,
//   });

//   factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
//     return LoginUserResponse(
//       message: json['message'],
//       token: json['token'],
//       user: LoginUser.fromJson(json['user']),
//     );
//   }

//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'message': message,
//   //     'token': token,
//   //     'user': user.toJson(),
//   //   };
//   // }
// }

// class LoginUser {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String phone;
//   final String userRole;

//   LoginUser({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phone,
//     required this.userRole,
//   });

//   factory LoginUser.fromJson(Map<String, dynamic> json) {
//     return LoginUser(
//       id: json['id'],
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       email: json['email'],
//       phone: json['phone'],
//       userRole: json['role'],
//     );
//   }

//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'id': id,
//   //     'email': email,
//   //     'role': role,
//   //   };
//   // }
// }

class LoginUserResponse {
  final String message;
  final String token;
  final User user;

  LoginUserResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
    return LoginUserResponse(
      message: json['message'],
      token: json['token'],
      user: User.fromJson(json['user']),
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

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String userRole;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.userRole,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      userRole: json['userRole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'userRole': userRole,
    };
  }
}
