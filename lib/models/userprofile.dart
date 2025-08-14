class Userprofile {
  String firstName;
  String lastName;
  String email;

  Userprofile({
    required this.firstName,
    required this.lastName,
    required this.email,
  });
  factory Userprofile.fromMap(Map<String, dynamic> map) {
    return Userprofile(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
    );
  }
  Map<String, dynamic> toMap() {
    return {'firstName': firstName, 'lastName': lastName, 'email': email};
  }
}
