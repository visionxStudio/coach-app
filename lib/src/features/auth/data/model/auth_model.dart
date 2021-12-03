import 'dart:convert';

class UserModel {
  final String email;
  final String password;
  final String devicename;

  UserModel({
    required this.email,
    required this.password,
    required this.devicename,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'device_name': devicename,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      password: map['password'],
      devicename: map['device_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? email,
    String? password,
    String? devicename,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      devicename: devicename ?? this.devicename,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.password == password &&
        other.devicename == devicename;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ devicename.hashCode;
}
