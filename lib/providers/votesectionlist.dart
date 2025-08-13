import 'package:e_vote/models/votesection.dart';
import 'package:flutter/material.dart';

class Votesectionlist extends ChangeNotifier {
  final _votingSectionList = [];
  get votingsectionlist => _votingSectionList;

  void addCandidate(Votesection candidate) {
    _votingSectionList.add(candidate);
    notifyListeners();
  }

  void deleteCandidate(Votesection candidate) {
    _votingSectionList.remove(candidate);
    notifyListeners();
  }
}
