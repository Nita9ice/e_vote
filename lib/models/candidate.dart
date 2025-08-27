import 'dart:io';

class Candidate {
  final String firstName;
  final String lastName;
  final dynamic image; // Use dynamic to support File (native) or Uint8List (web) 
  final int voteCount;

  Candidate({
    required this.firstName,
    required this.lastName,
    required this.image, 
    required this.voteCount,
  });

  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      image: map['candidateImage'] != null ? File(map['candidateImage']) : null,
      voteCount: map['voteCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'candidateImage': image?.path, // Store file path for serialization
      'voteCount': voteCount,
    };
  }
}