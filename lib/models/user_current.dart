import 'package:loja_virtual/models/user.dart';

class UserCurrent {
  String accessToken;
  User user;

  UserCurrent({
    required this.accessToken,
    required this.user,
  });

  factory UserCurrent.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'accessToken': String accessToken,
      } =>
        UserCurrent(
          accessToken: accessToken,
          user: User.fromJson(json["user"]),
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
