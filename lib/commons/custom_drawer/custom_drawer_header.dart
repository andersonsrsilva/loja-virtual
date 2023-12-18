import 'package:flutter/material.dart';
import 'package:loja_virtual/commons/custom_drawer/custom_drawer_header_name.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<UserManager>(builder: (_, userManager, __) {
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loja do \nAnderson',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomDrawerHeaderName(),
          ],
        );
      }),
    );
  }
}
