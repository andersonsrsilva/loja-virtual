class User {
  int? id;
  String? email;
  String? name;
  String? password;

  User({
    this.id,
    this.email,
    this.name,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'email': String email,
        'name': String name,
      } =>
        User(
          id: id,
          email: email,
          name: name,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
