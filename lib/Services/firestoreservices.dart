import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/models/votesection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class Firestoreservices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> submitVote(votingSectionList) async {
    final admin = auth.currentUser;
    if (admin != null) {
      final adminId = admin.uid;
      firebaseFirestore.collection('Admins').doc(adminId).set({
        'voting_sections': votingSectionList,
      });
    }
  }
}
