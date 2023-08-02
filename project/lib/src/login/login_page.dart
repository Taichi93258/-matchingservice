import 'package:flutter/material.dart';

import 'static_email_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
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
            ElevatedButton(
                onPressed: () => {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate())
                        {Navigator.pushNamed(context, '/home/profile')}
                    },
                child: const Text("Submit"))
          ],
        ),
      )),
    );
  }
}
