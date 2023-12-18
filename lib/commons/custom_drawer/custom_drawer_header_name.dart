import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeaderName extends StatelessWidget {
  const CustomDrawerHeaderName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(
      builder: (_, userManager, __) => Text(
        'Olá, ${userManager.userCurrent?.name ?? ''}',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
