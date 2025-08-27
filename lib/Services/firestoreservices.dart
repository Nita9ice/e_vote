import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/models/userprofile.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Firestoreservices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> submitVote(votingSectionList) async {
    final admin = auth.currentUser;
    if (admin != null) {
      final adminId = admin.uid;
      _firebaseFirestore.collection('Admins').doc(adminId).set({
        'voting_sections': votingSectionList,
      });
    }
  }

  //set voters details
  Future<void> uploadUserDetails(
    List<String> name,
    String email,
   
  ) async {
    final user = auth.currentUser;
    if (user != null) {
      final userId = user.uid;
      _firebaseFirestore
          .collection('users')
          .doc(userId)
          .set(Userprofile(name: name, email: email,).toMap());
    }
  }

 
}
