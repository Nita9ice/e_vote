import 'package:e_vote/models/candidate.dart'; 
import 'package:e_vote/models/auditor.dart'; 


class Election {
  String title;
  String description;
  DateTime? startDate;
  DateTime? endDate;
  List<Candidate> candidates;
  List<Auditor> auditors;

  Election({
    this.title = '',
    this.description = '',
    this.startDate,
    this.endDate,
    this.candidates = const [],
    this.auditors = const [],
  });
}