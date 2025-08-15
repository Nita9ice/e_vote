class Adminprofile {
  Set<String> name;
  String email;
  Adminprofile({required this.name, required this.email});

  factory Adminprofile.fromMap(Map<String, dynamic> map) {
    return Adminprofile(name: map['name'], email: map['email']);
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email};
  }
}
