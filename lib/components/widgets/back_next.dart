import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/models/create_election.dart';
import 'package:e_vote/providers/create_election_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackNextButton extends StatefulWidget {
  final String? text;
  final VoidCallback onPressed;
  const BackNextButton({super.key, required this.onPressed, this.text,});

  @override
  State<BackNextButton> createState() => _BackNextButtonState();
}

class _BackNextButtonState extends State<BackNextButton> {
//  void deleteHeading(CreateElection heading){
//   Provider.of<CreateElectionProvider>(context, listen: false).deleteHeading(heading);

//  }

// void electionHeading(){
//   final election =  Provider.of<CreateElectionProvider>(context, listen: false).electionHeading.map((element){return CreateElection(title: element.title, description: element.description, startDate: element.startDate, endDate: element.endDate);});
//   deleteHeading(election as CreateElection);
  
// }

  @override
  Widget build(BuildContext context) {
    return  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                      MyButton(buttonText: 'Back', onPressed:() {
                                       Navigator.pop(context);
                                     
                                      },
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                      ),
                                      MyButton(buttonText:widget.text?? 'Next', onPressed: widget.onPressed,
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                      ),
                                    ],
                                  );
  }
}