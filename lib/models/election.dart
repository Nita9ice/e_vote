import 'package:e_vote/models/candidate.dart';
import 'package:e_vote/models/auditor.dart';

class Election {
  String title;
  String description;
  DateTime? startDate;
  DateTime? endDate;
  List<Candidate>? candidates;
  List<Auditor>? auditors;

  factory Election.fromMap(Map<String, dynamic> map) {
    return Election(
      title: map['title'],
      description: map['description'],
      startDate: map['StartDate'],
      endDate: map['endDate'],
      candidates: List<Candidate>.from(map['candidtate']),
      auditors: List<Auditor>.from(map['auditore']),
    );
  }

  Election({
    this.title = '',
    this.description = '',
    this.startDate,
    this.endDate,
    this.candidates = const [],
    this.auditors = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'candidate': candidates?.map((e)=>e.toMap()).toList(),
      'auditors': auditors?.map((e)=>e.toMap()).toList(),
    };
  }
}
