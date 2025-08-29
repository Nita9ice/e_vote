
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/components/widgets/add_button.dart';
import 'package:e_vote/components/widgets/alert_box_status.dart';
import 'package:e_vote/components/widgets/auditor_alert_box.dart';
import 'package:e_vote/components/widgets/back_next.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:e_vote/models/auditor.dart';
import 'package:e_vote/models/candidate.dart';

import 'package:e_vote/models/election.dart'; // Import the new model
import 'package:e_vote/providers/electionprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAuditorScreen extends StatefulWidget {
  const AddAuditorScreen({super.key});

  @override
  State<AddAuditorScreen> createState() => _AddAuditorScreenState();
}

class _AddAuditorScreenState extends State<AddAuditorScreen> {
  // List of Auditors (managed locally until submit)
  List<Auditor> auditorList = [];

  // Controllers for input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // Added: For editing - track if we're editing and the index
  bool _isEditing = false;
  int _editIndex = -1;

  // Added: Receive Election model
  late Election _election;

  void addElection(Election data) {
    Provider.of<Electionprovider>(context, listen: false).addElection(data);
  }





  @override
  void initState() {
    super.initState();
    // Added: Get Election from arguments
    WidgetsBinding.instance.addPostFrameCallback((_) {
     
      setState(() { _election = ModalRoute.of(context)!.settings.arguments as Election;}); // If needed to refresh
    });
  }

  // Added: Email validation regex
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Function to add or update auditor
  void _saveAuditor() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      if (!_isValidEmail(emailController.text)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Invalid email format')));
        return;
      }
      final auditor = Auditor(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
      );
      setState(() {
        if (_isEditing) {
          auditorList[_editIndex] = auditor; // Update existing
        } else {
          auditorList.add(auditor); // Add new
        }
      });
      // Clear inputs
      _clearForm();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
    }
  }

  // Added: Function to edit auditor
  void _editAuditor(int index) {
    setState(() {
      _isEditing = true;
      _editIndex = index;
      firstNameController.text = auditorList[index].firstName;
      lastNameController.text = auditorList[index].lastName;
      emailController.text = auditorList[index].email;
    });
    showAddAuditorDialog(); // Open dialog with pre-filled data
  }

  // Added: Function to delete auditor
  void _deleteAuditor(int index) {
    setState(() {
      auditorList.removeAt(index);
    });
  }

  // Added: Clear form helpers
  void _clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    _isEditing = false;
    _editIndex = -1;
  }

  // Function to show the alert box (improved for edit)
  void showAddAuditorDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AuditorAlertBox(
            firstName: MyTextField(
              hintText: 'First Name',
              controller: firstNameController,
            ),
            lastName: MyTextField(
              hintText: 'Last Name',
              controller: lastNameController,
            ),
            email: MyTextField(hintText: 'Email', controller: emailController),
            button: MyButton(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              buttonText: _isEditing ? 'Edit' : 'Add',
              onPressed: () {
                _saveAuditor();
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            button2: MyButton(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              buttonText: 'Cancel',
              onPressed: () {
                _clearForm();
                Navigator.of(context).pop();
              },
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', width: 100),
                    const Text(
                      'E-voting',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Add Auditor',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                const SizedBox(height: 30),
                // Vertical listview for auditors (added edit/delete icons)
                SizedBox(
                  height: 200,
                  child:
                      auditorList.isEmpty
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
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  // Added: Stack for overlay icons
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${auditor.firstName} ${auditor.lastName}',
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
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 30,
                                              color: Color.fromRGBO(
                                                3,
                                                58,
                                                202,
                                                1,
                                              ),
                                            ),
                                            onPressed:
                                                () => _editAuditor(index),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                            onPressed:
                                                () => _deleteAuditor(index),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                ),

                const SizedBox(height: 20),
                Center(
                  child: AddButton(
                    text: 'Add',
                    onPressed: () {
                      _clearForm(); // Ensure form is clear for new add
                      showAddAuditorDialog();
                    },
                  ),
                ),
                const SizedBox(height: 100),
                BackNextButton(
                  text: 'Submit',
                  onPressed1: () {
                 
                
                      Navigator.pop(context);
                  },
                  onPressed: ()  {

                       addElection(
                      Election(
                        title: _election.title,
                        description: _election.description,
                        startDate: _election.startDate,
                        endDate: _election.endDate,
                        candidates: _election.candidates,
                        auditors: auditorList
                      ),
                    );

          
                    // Added: Update Election model
                    // _election.auditors = auditorList;

             
               showDialog(
                      context: context,
                      builder: (context) {
                        return AlertBoxStatus(
                          containerText: 'Successful',
                          containerImage: Image.asset(
                            'assets/images/logo.png',
                            color: Colors.black,
                          ),

                          onPressed: () {
                            Navigator.pushNamed(context, '/dashboard');
                            // Navigator.pushNamed(context,'/voters',);
                          },
                          imageHeight: 120,
                          imageWidth: 120,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
