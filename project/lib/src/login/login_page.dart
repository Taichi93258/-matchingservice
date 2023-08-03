import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/packages.dart';
import 'static_email_data.dart'; // check if the email is valid staticaly
import 'account_manager_firebase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
          child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Form for the email address
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "メールアドレスが空です";
                    }
                    return emailValidator(value);
                  },
                  decoration: const InputDecoration(
                    hintText: "メールアドレスを入力してください",
                  ),
                ),

                // Form for the password
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "パスワードが空です";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "パスワードを入力してください",
                  ),
                ),

                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState == null ||
                          !_formKey.currentState!.validate()) {
                        return;
                      }
                      // here the email and password is guaranteed to be valid form
                      // check if the email is registered
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      try {
                        final user = (await signInWithEmail(email, password))!;
                        if (user.emailVerified) {
                          if (mounted) {
                            Navigator.pushNamed(context, '/home/profile',
                                arguments: user);
                          }
                        } else {
                          // TODO: implement error handling
                          errorLog('Email is not verified');
                        }
                      } on FirebaseAuthException catch (e) {
                        // TODO: implement error handling
                        switch (e.code) {
                          case 'user-not-found':
                            errorLog('No user found for that email.');
                            break;
                          case 'wrong-password':
                            errorLog('Wrong password provided for that user.');
                            break;
                          case 'user-disabled':
                            errorLog(
                                'The user corresponding to the given email has been disabled.');
                            break;
                          case 'network-request-failed':
                            errorLog(
                                'Network error (such as timeout, interrupted connection or unreachable host) has occurred.');
                            break;
                          default:
                            errorLog(e.code);
                        }
                      }
                    },
                    child: const Text("ログインする"))
              ],
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login/signup'),
              child: const Text("アカウントを作成する")),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, '/home/profile', arguments: null),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrange[100])),
              child: const Text("一時的なバックドアでログインする",
                  style: TextStyle(fontSize: 10, color: Colors.red))),
        ],
      )),
    );
  }
}
