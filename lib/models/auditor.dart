
class Auditor {
  final String email;
  final String firstName;
  final String lastName;
  

  Auditor( {
    required this.email,
    required this.firstName,
    required this.lastName,
    
  });

  factory Auditor.fromMap(Map<String, dynamic> map) {
    return Auditor(
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      
    };
  }
}