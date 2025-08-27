class CreateElection {

  String title;
  String description;
  DateTime startDate;
  DateTime endDate;

  CreateElection({required this.title, required this.description, required this.startDate, required this.endDate});

 factory CreateElection.fromMap(Map<String, dynamic> map){
  return CreateElection(title: map['title'], description: map['description'], startDate: map['startTime'], endDate:map ['endTime']);
 }

 Map<String, dynamic>toMap(){
  return {
    'title':title,
    'description':description,
    'startTime':startDate,
    'endTime': endDate
  };
 }
}
