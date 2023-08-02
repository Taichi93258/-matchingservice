import 'package:flutter/material.dart';

import 'package:project/src/login/login_page.dart';
import 'package:project/src/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      // please add routes here
      routes: {
        '/login': (context) => const LoginPage(),
        '/home/profile': (context) => const ProfilePage(),
      },
    );
  }
}
