import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_current.dart';
import 'dart:convert';

class UserManager extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool get isLoggedIn => userCurrent != null;

  UserCurrent? userCurrent;

  Future<void> signIn(
      {required User user,
      required Function onFail,
      required Function onSuccess}) async {
    try {
      loading = true;

      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': user.email!,
          'password': user.password!,
        }),
      );

      _loadCurrentUser(response.body);

      loading = false;
      onSuccess();
    } on PlatformException catch (e) {
      onFail(e.code);
      loading = false;
    }
  }

  Future<void> signUp(
      {required User user,
      required Function onFail,
      required Function onSuccess}) async {
    try {
      loading = true;

      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': user.email!,
          'password': user.password!,
          'name': user.name!,
        }),
      );

      _loadCurrentUser(response.body);

      loading = false;
      onSuccess();
    } on PlatformException catch (e) {
      onFail(e.code);
      loading = false;
    }
  }

  void signOut() {
    userCurrent = null;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser(String body) async {
    userCurrent =
        UserCurrent.fromJson(jsonDecode(body) as Map<String, dynamic>);

    notifyListeners();
  }
}
