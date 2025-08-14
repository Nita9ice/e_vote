import 'package:firebase_auth/firebase_auth.dart';

class Authservices {
  final auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Stream<User?> get authChanges => auth.authStateChanges();
}
