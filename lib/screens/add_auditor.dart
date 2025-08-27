

import 'package:e_vote/components/widgets/add_button.dart';
import 'package:e_vote/components/widgets/auditor_alert_box.dart';
import 'package:e_vote/components/widgets/back_next.dart';
import 'package:e_vote/components/widgets/button.dart';

import 'package:e_vote/components/widgets/text_field.dart';
import 'package:e_vote/models/auditor.dart';


import 'package:flutter/material.dart';

class AddAuditorScreen extends StatefulWidget {
  const AddAuditorScreen({super.key});

  @override
  State<AddAuditorScreen> createState() => _AddAuditorScreenState();
}

class _AddAuditorScreenState extends State<AddAuditorScreen> {

  // List of Auditor
  List<Auditor> auditorList = [];
  
  // Controller for handling input in the email text field
  final TextEditingController emailController = TextEditingController();

  // Controller for handling input in the first name text field
  final TextEditingController firstNameController= TextEditingController();

    

  // Controller for handling input in the last name text field
  final TextEditingController lastNameController = TextEditingController();


  // Function to show the alert box
  void showAddAuditorDialog() {
    showDialog(
      context: context,
      builder: (context) => AuditorAlertBox(
        firstName:MyTextField(hintText: 'First Name', controller: firstNameController),
        lastName: MyTextField(hintText: 'Last Name', controller: lastNameController),
        email: MyTextField(hintText: 'Email', controller: emailController),
        button: MyButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          buttonText: 'Add',
          onPressed: () {
            // Add auditor to the list
            if (firstNameController.text.isNotEmpty &&
                lastNameController.text.isNotEmpty &&
                emailController.text.isNotEmpty) {
              setState(() {
                auditorList.add(Auditor(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                ));
              });
              // Clear controllers
              firstNameController.clear();
              lastNameController.clear();
              emailController.clear();
              Navigator.of(context).pop(); // Close dialog
            } else {
              // Show error if fields are empty
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fill all fields')),
              );
            }
          },
          
        ),
        button2: MyButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          buttonText: 'cancel',
          onPressed: () {
            // Clear controllers and close dialog
            firstNameController.clear();
            lastNameController.clear();
            emailController.clear();
            Navigator.of(context).pop();
          },
          
        ),
      ),
    );
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
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: 100,),
        
               Row(
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
          
              Text('Add Auditor',
              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),),
              ),
          
          
              SizedBox(height: 30,),
              // Vertical listview for auditors
              SizedBox(
                height: 200,
                
                child: auditorList.isEmpty
                    ? const Center(
                        child: Text(
                          'No Auditor added yet',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: auditorList.length,
                        itemBuilder: (context, index) {
                          final auditor = auditorList[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${auditor.firstName} ${auditor.lastName}',
                                  // '${auditorList.firstName} ${auditorList.lastName}',
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Email: ${auditor.email}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(height: 20,),
              Center(child: AddButton(text: 'Add', onPressed: showAddAuditorDialog)),
                          const SizedBox(height: 100,), 
        
                          BackNextButton(
                        
                           
                            text: 'Submit',
                            onPressed: (){}),
        
                          
            ],
          ),
        ),
      ),
    );
  }
}