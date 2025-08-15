class Userprofile {
  Set<String> name;
  String email;
  String role;

  Userprofile({required this.name, required this.email, required this.role});
  factory Userprofile.fromMap(Map<String, dynamic> map) {
    return Userprofile(
      name: map['name'],
      email: map['email'],
      role: map['role'],
    );
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, role: role};
  }
}
