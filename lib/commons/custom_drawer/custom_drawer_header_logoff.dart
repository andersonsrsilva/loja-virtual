import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeaderLogoff extends StatelessWidget {
  const CustomDrawerHeaderLogoff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(
      builder: (_, userManager, __) => GestureDetector(
        onTap: () {
          if (userManager.isLoggedIn) {
            userManager.signOut();
          } else {
            Navigator.of(context).pushNamed('/login');
          }
        },
        child: Text(
          userManager.isLoggedIn ? 'Sair' : 'Entre ou cadastre-se',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
