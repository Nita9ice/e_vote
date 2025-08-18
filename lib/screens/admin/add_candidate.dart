import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/alert_box2.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddCandidateScreen extends StatefulWidget {
  const AddCandidateScreen({super.key});

  @override
  State<AddCandidateScreen> createState() => _AddCandidateScreenState();
}

class _AddCandidateScreenState extends State<AddCandidateScreen> {
  // list of candidate

  List candidateList = [

  ];

  // Controller for handling input in the email text field
  final TextEditingController firstNameController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController lastNameController = TextEditingController();


// function to add candidate 



  // function to show alert box for  candidate details
  void addCandidateBox(){
    showDialog(context: context, builder: (context) {
      return AlertBox2(
        containerText: 'Add a Candidate',
                      circularAvatar: Image.asset('assets/images/image1.png'),
                      textField1: MyTextField(controller: firstNameController, hintText: 'First Name'),
                      textField2: MyTextField(controller: lastNameController, hintText: 'Last Name'),
                      button: MyButton(buttonText: 'Add', onPressed: (){}, padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),),
                      button2: MyButton(buttonText: 'Cancel', onPressed: (){
                        Navigator.pop(context);
                      }, padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),),
      );
    });
  }


  


  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(dimensions.widthPercent(7.5)), // ~32.25px
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),
              color: Color.fromRGBO(255, 255, 255, 1),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Image.asset('assets/images/logo.jpg',
                  height: 100,
                  width: 100,
                  ),
                  Text('E-VOTING',
                  style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: dimensions.widthPercent(4.7), // ~20.21px
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                  ),
                  
                ],
              ),

              SizedBox(height: 37,),

                  Text('STUDENTS UNION GOVERNMENT ELECTION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: dimensions.widthPercent(4.7), // ~20.21px
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                  ),

                  SizedBox(height: 12,),
                  Text('Election for the next leadership of the SUG for the \nnew academic year',
                   textAlign: TextAlign.center,
                  style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14, 
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                  ),

                  SizedBox(height: 300,),

                  Container(
                    height: 69,
                    width: 379,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dimensions.widthPercent(4.7)), // ~20.21px
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              
              Color.fromRGBO(132, 166, 255, 1),
              
              Color.fromRGBO(134, 138, 148, 1),
            ],
          ),
        ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Add Candidate',
                        style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: dimensions.widthPercent(4.7), // ~20.21px
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                        ),
                        // SizedBox(width: 10,),
                        IconButton(onPressed: addCandidateBox, icon: Icon(Icons.add_box,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        size: 30,
                        ))
                      ],
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}