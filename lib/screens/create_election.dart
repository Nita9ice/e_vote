import 'package:e_vote/components/widgets/back_next.dart';
import 'package:e_vote/components/widgets/create_textfield.dart';





import 'package:e_vote/models/election.dart';
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
  final TextEditingController descriptionController = TextEditingController();

  // Added: Function for date validation
  void _validateDates() {
    if (_startDate != null &&
        _endDate != null &&
        _endDate!.isBefore(_startDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('End date must be after start date')),
      );
    }
  }

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
      _validateDates();
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
      _validateDates();
    }
  }

  // Added: Function to validate inputs and provide specific feedback
  String? _validateInputs() {
    if (titleController.text.trim().isEmpty) {
      return 'Please enter a title';
    }
    if (descriptionController.text.trim().isEmpty) {
      return 'Please enter a description';
    }
    if (_startDate == null) {
      return 'Please select a start date';
    }
    if (_endDate == null) {
      return 'Please select an end date';
    }
    if (_endDate!.isBefore(_startDate!)) {
      return 'End date must be after start date';
    }
    return null; // No errors
  }



  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
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
                SizedBox(height: 100),

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

                        // color: Color.fromRGBO(3, 58, 202, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                const Text(
                  'Create Election',

                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),

                    // color: Color.fromRGBO(3, 58, 202, 1),
                  ),
                ),
                const SizedBox(height: 50),

                TextField2(text: 'Title', controller: titleController),

                const SizedBox(height: 30),

                Container(
                  padding: EdgeInsets.all(16),
                  height: 200,
                  decoration: BoxDecoration(
                    // color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      // color: Color.fromRGBO(1, 20, 70, 1),
                      width: 2,
                    ),
                  ),
                  child: TextField(
                    controller: descriptionController,
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
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Start Date Box
                    GestureDetector(
                      onTap: _pickStartDate,
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
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromRGBO(96, 96, 96, 1),
                              size: 20,
                            ),
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
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromRGBO(96, 96, 96, 1),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 100),

                BackNextButton(
                  onPressed1: () {
                  
                    
                       Navigator.pop(context);
                  },
                  onPressed: () {
                    final errorMessage = _validateInputs();
                    if (errorMessage != null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(errorMessage)));
                    }else{
                     
      
                final election =   Election(
                        title: titleController.text.trim(),
                        description: descriptionController.text.trim(),
                        startDate: _startDate,
                        endDate: _endDate 
                     
                    );
                    Navigator.pushNamed(context, '/candidate', arguments: election);

                    }

                   
                    
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
