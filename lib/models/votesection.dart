class Votesection {
  String title;
  String? candidateimage;
  String candidateName;

  Votesection({
    required this.title,
    this.candidateimage,
    required this.candidateName,
  });
  factory Votesection.fromMap(Map<String, dynamic> map) {
    return Votesection(
      title: map['title'],
      candidateimage: map['candidateImage'],
      candidateName: map['candidateName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'candidateimage': candidateimage,
      'candidateName': candidateName,
    };
  }
}
