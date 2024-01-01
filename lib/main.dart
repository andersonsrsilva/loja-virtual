import 'package:flutter/material.dart';
import 'package:loja_virtual/models/managers/produtc_manager.dart';
import 'package:loja_virtual/models/managers/user_manager.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
import 'package:loja_virtual/screens/signup/sign_up_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserManager>(create: (_) => UserManager()),
        ChangeNotifierProvider<ProductManager>(create: (_) => ProductManager()),
      ],
      child: MaterialApp(
        title: 'Loja do Anderson',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 4, 125, 141),
          ),
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
