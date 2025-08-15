class Votingsection {
  String title;
  String description;
  String userCode;
  String auditorCode;
  Votingsection({
    required this.title,
    required this.description,
    required this.userCode,
    required this.auditorCode,
  });

  factory Votingsection.fromMap(Map<String, dynamic> map) {
    return Votingsection(
      title: map['title'],
      description: map['description'],
      userCode: map['userCode'],
      auditorCode: map['auditorCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'userCode': userCode,
      'auditorCode': auditorCode,
    };
  }
}
