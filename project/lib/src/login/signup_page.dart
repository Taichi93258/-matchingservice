import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/packages.dart';
import 'account_manager_firebase.dart';
import 'static_email_data.dart'; // check if the email is valid staticaly

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up Page"),
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
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "パスワードが空です";
                      }
                      if (value.length < 6) {
                        return "パスワードは6文字以上です";
                      }
                      return null;
                    },
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

                        final email = _emailController.text;
                        final password = _passwordController.text;

                        try {
                          registerWithEmail(email, password);
                        } on FirebaseAuthException catch (e) {
                          // TODO: implement error handling
                          errorLog(e.code);
                          switch (e.code) {
                            case 'email-already-in-use':
                              break;
                            case 'netword-error':
                              break;
                            default:
                              break;
                          }
                        }

                        // check if context is still mounted to the widget tree
                        if (mounted) {
                          Navigator.pushNamed(context, '/login/create_acount',
                              arguments: email);
                        }
                      },
                      child: const Text("作成する"))
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: const Text("アカウントにログインする"))
          ],
        )),
      );
}
