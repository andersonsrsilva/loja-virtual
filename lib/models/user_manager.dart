import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:loja_virtual/models/user_current.dart';
import 'dart:convert';

import 'package:loja_virtual/models/user_login.dart';

class UserManager extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn(
      {required UserLogin userLogin,
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
          'email': userLogin.email,
          'password': userLogin.password,
        }),
      );

      dynamic userCurrent = UserCurrent.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      loading = false;
      onSuccess(userCurrent);
    } on PlatformException catch (e) {
      onFail(e.code);
      loading = false;
    }
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
