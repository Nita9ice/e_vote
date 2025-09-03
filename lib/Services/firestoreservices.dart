import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/models/auditor.dart';
import 'package:e_vote/models/candidate.dart';
import 'package:e_vote/models/election.dart';
import 'package:e_vote/models/ids.dart';
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
    return _firebaseFirestore
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

  Future<Election?> electionPoll(String userId, String electionId) async {
    final docRef = _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('Elections')
        .doc(electionId);
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      return Election.fromMap(docSnapshot.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<void> incrementVote(String userId, String electionId, int? candidateIndex) async {
  final docRef =  _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('Elections')
        .doc(electionId);

        final doc = await docRef.get();
        if(doc.exists){
         final data = doc.data();
         final candidates = data?['candidate'] as List<dynamic>;
         candidates[candidateIndex??0]['voteCount'] +=1;

         await docRef.update({'candidate': candidates});


        }
        
  }

Future<Ids>getElectionId(String userId)async{
final colRef =  _firebaseFirestore.collection('users').doc(userId).collection('Elections');
final snapshot = await colRef.limit(1).get();
if(snapshot.docs.isEmpty){
  throw Exception('no election found for user $userId');
}
 final electionDoc = snapshot.docs.first;
 final electionId = electionDoc.id;
return Ids(userId: userId, electionId: electionId);

  }
}
