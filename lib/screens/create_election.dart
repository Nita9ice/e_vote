import 'package:e_vote/components/utilities/date_option.dart';
import 'package:e_vote/components/widgets/back_next.dart';

import 'package:e_vote/components/widgets/textField_create.dart';
import 'package:flutter/material.dart';

class CreatElectionScreen extends StatefulWidget {
  const CreatElectionScreen({super.key});

  @override
  State<CreatElectionScreen> createState() => _CreatElectionScreenState();
}

class _CreatElectionScreenState extends State<CreatElectionScreen> {

  DateTime? _startDate;
  DateTime? _endDate;

    // Controller for handling input in the email text field
  final TextEditingController titleController = TextEditingController();

  // Controller for handling input in the first name text field
  final TextEditingController decriptionController= TextEditingController();

    

  // Controller for handling input in the last name text field
  final TextEditingController lastNameController = TextEditingController();

// function to select start date
   Future<void> _pickStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }


// function to select start date
  Future<void> _pickEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }


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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
        
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
         children: [
             
                  Image.asset(
                 'assets/images/logo.png',
                 width: 100,
               ),
               const Text('E-voting',
               
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                // color: Color.fromRGBO(3, 58, 202, 1),
                                
                              ),
               ),
               
               ],
         
                   ),
                   SizedBox(height: 20,),
                 const Text('Create Election',
                        
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  // color: Color.fromRGBO(3, 58, 202, 1),
                                  
                                ),
                                ),
                                const SizedBox(height: 50,),
        
                                TextField2(text: 'Title',
                                controller: titleController,
                                ),
        
                                const SizedBox(height: 30,),
        
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

                                SizedBox(height: 50,),

                               Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    // Start Date Box
    GestureDetector(
      onTap: _pickStartDate ,
      child: SizedBox(
        
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _startDate == null
                  ? 'Start Date'
                  : _startDate.toString().split(' ')[0],
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(96, 96, 96, 1),
              ),
            ),
            const Icon(Icons.arrow_drop_down,color: Color.fromRGBO(96, 96, 96, 1), size: 20),
          ],
        ),
      ),
    ),

    // const SizedBox(width: 12), // space between boxes

    // End Date Box
    GestureDetector(
      onTap: _pickEndDate,
      child: SizedBox(
        
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _endDate == null
                  ? 'End Date'
                  : _endDate.toString().split(' ')[0],
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(96, 96, 96, 1),
              ),
            ),
            const Icon(Icons.arrow_drop_down,color: Color.fromRGBO(96, 96, 96, 1), size: 20),
          ],
        ),
      ),
    ),
  ],
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