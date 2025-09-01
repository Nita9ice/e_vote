import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/models/auditor.dart';
import 'package:e_vote/models/candidate.dart';
import 'package:e_vote/models/election.dart';
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
  Future<void> uploadUserDetails(List<String> name, String email) async {
    final user = auth.currentUser;
    if (user != null) {
      final userId = user.uid;
      _firebaseFirestore
          .collection('users')
          .doc(userId)
          .set(Userprofile(name: name, email: email).toMap());
    }
  }

  Future<void> electionToFireStore(
    String title,
    String description,
    DateTime? startDate,
    DateTime? endDate,
    List<Candidate>? candidate,
    List<Auditor>? auditors,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      await _firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('Elections')
          .add(
            Election(
              title: title,
              description: description,
              startDate: startDate,
              endDate: endDate,
              candidates: candidate,
              auditors: auditors,
            ).toMap(),
          );
    }
  }

  Stream<List<Election>> getElectionStream(String userId) {
   
    return  _firebaseFirestore
          .collection('users')
          .doc(userId)
          .collection('Elections')
          .snapshots()
          .map((snapShot) {
            return snapShot.docs.map((doc) {
              final data = doc.data();
              return Election.fromMap(data);
            }).toList();
          });
     
          
    }
  
  }

