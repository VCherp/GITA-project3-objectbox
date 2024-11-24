import 'package:flutter/material.dart';

import 'screens/main_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/details_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/sign-up-screen': (context) => const SignUpScreen(),
        '/details_screen': (context) => const DetailsScreen(),
      },
    );
  }
}
