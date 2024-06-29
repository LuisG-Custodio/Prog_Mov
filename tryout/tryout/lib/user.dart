class User {
  final int? id;
  final String username;
  final String password;
  final String birthDate;

  User(
      {this.id,
      required this.username,
      required this.password,
      required this.birthDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'birthDate': birthDate,
    };
  }
}
