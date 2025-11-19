class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  //I am converting into json

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }

  //I am converting into dart objects
  factory UserModel.fromJson(Map<String, dynamic> fromJson) {
    return UserModel(
      name: fromJson['name'] ?? '',
      email: fromJson['email'],
      password: fromJson['password'],
    );
  }
}
