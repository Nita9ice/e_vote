class Userprofile {
  String firstName;
  String lastName;
  String email;
  String role;
  Userprofile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
  });
  factory Userprofile.fromMap(Map<String, dynamic> map) {
    return Userprofile(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      role: map['role'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
    };
  }
}
