import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  final String password;
  final String typeuser;
  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.typeuser,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? password,
    String? typeuser,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      typeuser: typeuser ?? this.typeuser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'typeuser': typeuser,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
      password: map['password'],
      typeuser: map['typeuser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, password: $password, typeuser: $typeuser)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.email == email &&
      other.name == name &&
      other.password == password &&
      other.typeuser == typeuser;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      name.hashCode ^
      password.hashCode ^
      typeuser.hashCode;
  }
}
