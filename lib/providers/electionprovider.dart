import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/models/election.dart';
import 'package:flutter/material.dart';

class Electionprovider extends ChangeNotifier {
  List<Election> electionList = [];

Future<void> addElection(Election electionData) async {
    electionList.add(electionData);
    notifyListeners();
try{
    final fireStore = Firestoreservices();
   await fireStore.electionToFireStore(
      electionData.title,
      electionData.description,
      electionData.startDate,
      electionData.endDate,
      electionData.candidates,
      electionData.auditors,
    );
    
    
    }catch(e){
      print(e.toString());
    }
  

  }
}
