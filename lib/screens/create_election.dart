import 'package:e_vote/components/widgets/back_next.dart';
import 'package:e_vote/components/widgets/textField_create.dart';
import 'package:flutter/material.dart';

class CreatElectionScreen extends StatefulWidget {
  const CreatElectionScreen({super.key});

  @override
  State<CreatElectionScreen> createState() => _CreatElectionScreenState();
}

class _CreatElectionScreenState extends State<CreatElectionScreen> {

    // Controller for handling input in the email text field
  final TextEditingController titleController = TextEditingController();

  // Controller for handling input in the first name text field
  final TextEditingController decriptionController= TextEditingController();

    

  // Controller for handling input in the last name text field
  final TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const SizedBox(height: 200,),
                 const Text('Create Election',
                        
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  // color: Color.fromRGBO(3, 58, 202, 1),
                                  
                                ),
                                ),
                                const SizedBox(height: 100,),
        
                                TextField2(text: 'Title',
                                controller: titleController,
                                ),
        
                                const SizedBox(height: 50,),
        
                                Container(
                                  padding: EdgeInsets.all(16),
                                  height: 200,
                                  decoration: BoxDecoration(
                                    // color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      // color: Color.fromRGBO(1, 20, 70, 1),
                                      width: 2
                                    )
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 20,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      
                                      border: InputBorder.none,
                                      hintText: 'Write your Description',
                                      hintStyle: TextStyle(
                                        
                                        
                                        color: Color.fromRGBO(96, 96, 96, 1),
                                        fontSize: 20,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                      )
                                    ),
                                  ),
                                ),
        
                                SizedBox(height: 100,),
        
                                BackNextButton(onPressed: (){
                                        Navigator.pushNamed(context, '/candidate');
                                      },),
        
                                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}