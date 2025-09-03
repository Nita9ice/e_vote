class Ids {
String userId;
String electionId;

Ids({required this.userId, required this.electionId});

factory Ids.fromMap(Map<String,dynamic> map){
  return 

  Ids(userId: map['userId'], electionId: map['electionId']);
}

Map<String,dynamic>toMap(){
  return 
  {'userId':userId, 'electionId':electionId};
}


}