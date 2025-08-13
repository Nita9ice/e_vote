import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/models/userprofile.dart';
import 'package:e_vote/models/votesection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class Firestoreservices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
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

  Future<void> uploadUserDetails(
    String firstName,
    String lastName,
    String email,
    String role,
  ) async {
    final user = auth.currentUser;
    if (user != null) {
      final userId = user.uid;
      _firebaseFirestore
          .collection('users')
          .doc(userId)
          .set(
            Userprofile(
              firstName: firstName,
              lastName: lastName,
              email: email,
              role: role,
            ).toMap(),
          );
    }
  }
}
