import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/models/candidate.dart';
import 'package:e_vote/models/auditor.dart';
import 'package:e_vote/models/ids.dart';

class Election {
  Ids? ids;
  String title;
  String description;
  DateTime? startDate;
  DateTime? endDate;
  List<Candidate>? candidates;
  List<Auditor>? auditors;

  factory Election.fromMap(Map<String, dynamic> map) {
    return Election(
     // ids: map['ids'],
      title: map['title'],
      description: map['description'],
      startDate: map['startDate'] is Timestamp?(map['startDate']as Timestamp).toDate():null,
      endDate: map['endDate'] is Timestamp?(map['endDate'] as Timestamp).toDate(): null,
      candidates: (map['candidate'] as List<dynamic>?)?.map((e)=>Candidate.fromMap(e)).toList()?? [],
      auditors: (map['auditors'] as List<dynamic>?)?.map((e)=>Auditor.fromMap(e)).toList()??[]
    );
  }

  Election({
   this.ids,
    this.title = '',
    this.description = '',
    this.startDate,
    this.endDate,
    this.candidates = const [],
    this.auditors = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'ids':ids,
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'candidate': candidates?.map((e)=>e.toMap()).toList(),
      'auditors': auditors?.map((e)=>e.toMap()).toList(),
    };
  }
}
