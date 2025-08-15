import 'package:e_vote/models/candidate.dart';
import 'package:flutter/material.dart';

class Candidatelistprovider extends ChangeNotifier {
  final _votingSectionList = [];
  get votingsectionlist => _votingSectionList;

  void addCandidate(Candidate candidate) {
    _votingSectionList.add(candidate);
    notifyListeners();
  }

  void deleteCandidate(Candidate candidate) {
    _votingSectionList.remove(candidate);
    notifyListeners();
  }
}
