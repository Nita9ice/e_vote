class Votingsection {
  String title;
  String? candidateimage;
  String candidateName;
  String candidateGroup;
  Votingsection({
    required this.title,
    this.candidateimage,
    required this.candidateName,
    required this.candidateGroup,
  });
  factory Votingsection.fromMap(Map<String, dynamic> map) {
    return Votingsection(
      title: map['title'],
      candidateimage: map['candidateImage'],
      candidateName: map['candidateName'],
      candidateGroup: map['candidtateGroup'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'candidateimage': candidateimage,
      'candidateName': candidateName,
      'candidateGroup': candidateGroup,
    };
  }
}
