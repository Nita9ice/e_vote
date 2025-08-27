import 'dart:io';
import 'dart:typed_data';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/back_next.dart';
import 'package:e_vote/components/widgets/add_button.dart';
import 'package:e_vote/components/widgets/candidate-alert_box.dart'; 
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:e_vote/models/election.dart'; 
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:e_vote/models/candidate.dart'; 

class AddCandidateScreen extends StatefulWidget {
  const AddCandidateScreen({super.key});

  @override
  State<AddCandidateScreen> createState() => _AddCandidateScreenState();
}

class _AddCandidateScreenState extends State<AddCandidateScreen> {
  // List of candidates (now part of Election model, but managed locally until submit)
  List<Candidate> candidateList = [];

  // Controllers for input fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // Store selected image (File for native, Uint8List for web)
  dynamic _selectedImage;

  // Added: For editing - track if we're editing and the index
  bool _isEditing = false;
  int _editIndex = -1;

  // Added: Receive Election model
  late Election _election;

  @override
  void initState() {
    super.initState();
    // Added: Get Election from arguments
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _election = ModalRoute.of(context)!.settings.arguments as Election;
      setState(() {}); // If needed to refresh
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  // Function to pick an image file (with basic error handling)
  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        // Added: Basic size check (e.g., <5MB)
        final size = kIsWeb ? result.files.single.bytes!.length : await File(result.files.single.path!).length();
        if (size > 5 * 1024 * 1024) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image too large (max 5MB)')),
          );
          return;
        }
        if (kIsWeb) {
          _selectedImage = result.files.single.bytes; // Uint8List for web
        } else {
          _selectedImage = File(result.files.single.path!); // File for native
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  // Function to add or update candidate
  void _saveCandidate() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        _selectedImage != null) {
      final candidate = Candidate(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        image: _selectedImage,
        voteCount: 0,
      );
      setState(() {
        if (_isEditing) {
          candidateList[_editIndex] = candidate; // Update existing
        } else {
          candidateList.add(candidate); // Add new
        }
      });
      // Clear inputs
      _clearForm();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and select an image')),
      );
    }
  }

  // Added: Function to edit candidate
  void _editCandidate(int index) {
    setState(() {
      _isEditing = true;
      _editIndex = index;
      firstNameController.text = candidateList[index].firstName;
      lastNameController.text = candidateList[index].lastName;
      _selectedImage = candidateList[index].image;
    });
    addCandidateBox(); // Open dialog with pre-filled data
  }

  // Added: Function to delete candidate
  void _deleteCandidate(int index) {
    setState(() {
      candidateList.removeAt(index);
    });
  }

  // Added: Clear form helpers
  void _clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    _selectedImage = null;
    _isEditing = false;
    _editIndex = -1;
  }

  // Function to show alert box for candidate details (improved with StatefulBuilder)
  void addCandidateBox() {
    showDialog(
      context: context,
      builder: (context) {

        return StatefulBuilder( // Improved: Use StatefulBuilder to update dialog UI without closing
          builder: (context, setDialogState) {
            return CandidateAlertBox(
              containerText: _isEditing ? 'Edit Candidate' : 'Add a Candidate',
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
                buttonText: _isEditing ? 'Edit' : 'Add',
                onPressed: () {
                  _saveCandidate();
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              ),
              button2: MyButton(
                buttonText: 'Cancel',
                onPressed: () {
                  _clearForm();
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              onPickImage: () async {
                await _pickImage();
                setDialogState(() {}); // Improved: Refresh dialog to show new image
              },
            );
          },
=======
       
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(dimensions.widthPercent(7.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                    ),
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
                  'Add Candidate',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                const SizedBox(height: 30),
                
                // Horizontal listview for candidates (added edit/delete icons)
SizedBox(
  height: 250,
  child: candidateList.isEmpty
      ? const Center(
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
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 220,
                  // maxHeight: 300,
                  minWidth: 160, // prevents card from collapsing too small
                  // maxWidth: 250, // prevents card from being too wide
                ),
                child: IntrinsicHeight(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // content defines height
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),

                        CircleAvatar(
                          radius: 50,
                          backgroundImage: candidate.image != null
                              ? (kIsWeb
                                  ? MemoryImage(candidate.image as Uint8List)
                                  : FileImage(candidate.image as File))
                              : null,
                          child: candidate.image == null
                              ? const Icon(Icons.person, size: 50)
                              : null,
                        ),

                        const SizedBox(height: 8),
                        Flexible(
                          child: Text(
                            
                            '${candidate.firstName} ${candidate.lastName}',
                            
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2, // avoids overflow if name is long
                          ),
                        ),
                        Text(
                          'Votes: ${candidate.voteCount}',
                          style: const TextStyle(fontSize: 14),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                size: 30,
                                color: Color.fromRGBO(3, 58, 202, 1),
                              ),
                              onPressed: () => _editCandidate(index),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () => _deleteCandidate(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
      addCandidateBox();
    },
  ),
),

                const Spacer(),
                BackNextButton(
                  onPressed: () {
                    // Added: Update Election model and pass to next screen
                    _election.candidates = candidateList;
                    Navigator.pushNamed(
                      context,
                      '/auditor',
                      arguments: _election,
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