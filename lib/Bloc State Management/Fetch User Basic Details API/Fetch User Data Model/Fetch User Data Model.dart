class UserModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName':lastName,
      'email': email,
      'phone': phone,
    };
  }
}