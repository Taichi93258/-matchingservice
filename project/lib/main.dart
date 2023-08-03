import 'package:project/packages.dart';

import 'package:project/src/login/login_page.dart';
import 'package:project/src/login/create_account.dart';
import 'package:project/src/login/signup_page.dart';
import 'package:project/src/home/profile_page.dart';

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
        '/login/signup': (context) => const SignupPage(),
        '/login/create_account': (context) => const CreateAccount(),
        '/home/profile': (context) => const ProfilePage(),
      },
    );
  }
}
