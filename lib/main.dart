import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: BaseScreen(),
    );
  }
}
