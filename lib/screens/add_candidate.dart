import 'dart:io';
import 'dart:typed_data';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/back_next.dart';
import 'package:e_vote/components/widgets/add_button.dart';
import 'package:e_vote/components/widgets/candidate-alert_box.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:e_vote/models/candidate.dart'; // Adjust path to your Candidate model

class AddCandidateScreen extends StatefulWidget {
  const AddCandidateScreen({super.key});

  @override
  State<AddCandidateScreen> createState() => _AddCandidateScreenState();
}

class _AddCandidateScreenState extends State<AddCandidateScreen> {
  // List of candidates
  List<Candidate> candidateList = [];

  // Controllers for input fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // Store selected image (File for native, Uint8List for web)
  dynamic _selectedImage;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  // Function to pick an image file
  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        setState(() {
          if (kIsWeb) {
            _selectedImage = result.files.single.bytes; // Uint8List for web
          } else {
            _selectedImage = File(result.files.single.path!); // File for native
          }
        });
        // Reopen the dialog to reflect the new image
        Navigator.pop(context); // Close current dialog
        addCandidateBox(); // Reopen dialog with updated _selectedImage
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  // Function to add candidate
  void _addCandidate() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        _selectedImage != null) {
      setState(() {
        candidateList.add(Candidate(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          image: _selectedImage,
          voteCount: 0,
        ));
      });
      // Clear inputs
      firstNameController.clear();
      lastNameController.clear();
      _selectedImage = null;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select an image')),
      );
    }
  }

  // Function to show alert box for candidate details
  void addCandidateBox() {
    showDialog(
      context: context,
      builder: (context) {
        return CandidateAlertBox.CandidateAlertBox(

          containerText: 'Add a Candidate',
          circularAvatar: _selectedImage != null
              ? kIsWeb
                  ? Image.memory(
                      _selectedImage as Uint8List,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/image1.png'),
                    )
                  : Image.file(
                      _selectedImage as File,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/image1.png'),
                    )
              : Image.asset('assets/images/image1.png'),
          textField1: MyTextField(controller: firstNameController, hintText: 'First Name'),
          textField2: MyTextField(controller: lastNameController, hintText: 'Last Name'),
          button: MyButton(
            buttonText: 'Add',
            onPressed: () {
              _addCandidate();
              Navigator.pop(context);
            },
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          ),
          button2: MyButton(
            buttonText: 'Cancel',
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          onPickImage: _pickImage,
        );
      },
    );
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
          
              Text('Add Candidate',
              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),),
              ),
          
          
              SizedBox(height: 30,),
              // Horizontal listview for candidate
              SizedBox(
                height: 200,
                child: candidateList.isEmpty
                    ? Center(
                        child: Text(
                          'No candidates added yet',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: candidateList.length,
                        itemBuilder: (context, index) {
                          final candidate = candidateList[index];
                          return Card(
                            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Container(
                              width: 150,
                              height: 214,
                              decoration: BoxDecoration(
                                // color: Color.fromRGBO(96, 96, 96, 1),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  candidate.image != null
                                      ? kIsWeb
                                          ? Image.memory(
                                              candidate.image as Uint8List,
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Icon(Icons.error, size: 50);
                                              },
                                            )
                                          : Image.file(
                                              candidate.image as File,
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Icon(Icons.error, size: 50);
                                              },
                                            )
                                      : Icon(Icons.person, size: 50),
                                  SizedBox(height: 8),
                                  Text(
                                    '${candidate.firstName} ${candidate.lastName}',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Votes: ${candidate.voteCount}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
          
              SizedBox(height: 20,),
          
              Center(child: AddButton(text: 'Add', onPressed: addCandidateBox,
              
              ),
              
              ),
              
          Spacer(),
              BackNextButton(onPressed: (){
                                      Navigator.pushNamed(context, '/auditor');
                                    },)
            ],
          ),
        ),
      ),
    );
  }
}