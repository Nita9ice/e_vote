class Candidate {
  String? name;
  String image;
  int voteCount;

  Candidate({this.name, required this.image, required this.voteCount});
  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      name: map['candidateImage'],
      image: map['candidateName'],
      voteCount: map['voteCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'candidateimage': image, 'candidateName': name};
  }
}
