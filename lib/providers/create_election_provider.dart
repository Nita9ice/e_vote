import 'package:e_vote/models/create_election.dart';
import 'package:flutter/material.dart';

class CreateElectionProvider extends ChangeNotifier{
  List<CreateElection> electionHeading = [] ;

void addHeading(CreateElection heading){
 electionHeading.add(heading);
 notifyListeners();

 print(electionHeading.map((element){
  return {element.title, element.description, element.startDate, element.endDate};
 }).length);
 print(electionHeading.map((element){
  return {element.title, element.description, element.startDate, element.endDate};
 }));
}

void deleteHeading(CreateElection heading){

  electionHeading.remove(heading);
  notifyListeners();
}

  
}