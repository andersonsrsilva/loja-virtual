class User {
  int id;
  String email;
  String firstname;
  String lastname;

  User({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'email': String email,
        'firstname': String firstname,
        'lastname': String lastname,
      } =>
        User(
          id: id,
          email: email,
          firstname: firstname,
          lastname: lastname,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
