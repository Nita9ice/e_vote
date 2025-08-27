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
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<User?> get authChanges => auth.authStateChanges();


  
}

class Emailservices {
  final auth = FirebaseAuth.instance;
  Future<void> sendEmailVerification()async {
    try{
    final user = auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      
    }else{print('verification link not sent');}}catch(e){print(e.toString());}
  }

  bool emailVerified(){
    final user = auth.currentUser;
    if(user != null){
    final verified =  user.emailVerified;
     if(verified){
      return true;
     }
     return false;
    }
    return false; 
  }
}
