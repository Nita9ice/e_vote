

class Userprofile {
  List<String> name;
  String email;


  Userprofile({required this.name, required this.email, });
  factory Userprofile.fromMap(Map<String, dynamic> map) {
    return Userprofile(
      name: List<String>.from(map['name']),
      email: map['email'],
   
    );
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email,};
  }
}
