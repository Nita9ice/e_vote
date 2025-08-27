
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/models/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userprofileprovider extends ChangeNotifier{

  Userprofile? userProfile;

  Userprofileprovider()  {
  getUserProfile();
  }

  void getUserProfile()async{
    final auth = FirebaseAuth.instance.authStateChanges();
   final user = FirebaseAuth.instance.currentUser;
   final fireStore = FirebaseFirestore.instance;
    
if(user != null ){
 auth.listen((user) async{
final docSnapShot = await  fireStore.collection('users').doc(user!.uid).get();
final data = docSnapShot.data();
if(data != null){
  userProfile = Userprofile.fromMap(data); 
  notifyListeners();

}

 },);
}

  }
}