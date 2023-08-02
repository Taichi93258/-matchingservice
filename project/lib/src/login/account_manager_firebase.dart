import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> registerWithEmail(String email, String password) async {
  final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User? user = userCredential.user;

  if (user != null && !user.emailVerified) {
    await user.sendEmailVerification();
  }
}

Future<User?> signInWithEmail(String email, String password) async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final UserCredential userCredential = await auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User? user =
      userCredential.user; // throws FirebaseAuthException on errors

  return user; // returns the logined user
}
